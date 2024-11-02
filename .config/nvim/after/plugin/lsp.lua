local lsp = require('lsp-zero')

lsp.preset("recommended")

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = "nvim_lsp_signature_help" },
        { name = 'buffer' },
        { name = 'path' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-v>'] = cmp.mapping.confirm({ select = true })
    })
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

function table.contains(table, element)
    for _, value in ipairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("i", "<C-f>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>k", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>j", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)

    local current_filetype = vim.bo.filetype
    local prettier_filetypes = { "javascript", "typescriptreact", "typescript", "css", "html", "json" }

    if table.contains(prettier_filetypes, current_filetype) then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.cmd('Prettier')
            end
        })
    elseif client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
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
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'rust_analyzer',
        'jdtls',
        'pyright',
        'dockerls',
        'tailwindcss',
        'cssls',
        'lua_ls',
        'clangd',
    },
    handlers = {
        lsp.default_setup
    }
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
