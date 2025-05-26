local cmp = require('cmp')
local luasnip = require('luasnip')

vim.diagnostic.config({
    virtual_text = true
})

require('mason').setup({})
require('mason-lspconfig').setup({
    automatic_enable = true,
})

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = "nvim_lsp_signature_help" },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
    mapping = cmp.mapping.preset.insert({
        -- not tested
        ['<C-n>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-p>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<C-v>'] = cmp.mapping.confirm({ select = true })
    })
})


local format_group = vim.api.nvim_create_augroup("LspFormatting", {})

function table.contains(table, element)
    for _, value in ipairs(table) do
        if value == element then
            return true
        end
    end
    return false
end


-- is called every time a LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(args)
        local bufnr = args.buf
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        local opts = { buffer = bufnr, remap = false }

        -- only set keymaps if LSP attaches
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        -- missing: vim.lsp.buf.type_definition(), vim.lsp.buf.implementation()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("i", "<C-f>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>k", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
        vim.keymap.set("n", "<leader>j", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
        vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                if vim.snippet then
                    vim.snippet.stop()
                end
            end
        })

        local current_filetype = vim.bo.filetype
        local prettier_filetypes = { "javascript", "svelte", "typescriptreact", "typescript", "css", "html", "json" }

        if table.contains(prettier_filetypes, current_filetype) then
            vim.api.nvim_clear_autocmds({ group = format_group, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = format_group,
                buffer = bufnr,
                callback = function()
                    vim.cmd('Prettier')
                end
            })
        elseif client:supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = format_group, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = format_group,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        filter = function()
                            return client.name ~= "ts_ls" and client.name ~= "cssls"
                        end,
                        bufnr = bufnr,
                    })
                end,
            })
        end
    end
})
