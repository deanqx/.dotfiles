local lspconfig = require("lspconfig")

lspconfig.ltex.setup {
    cmd = { vim.fn.expand("~/.local/share/nvim/language_servers/ltex-ls-16.0.0-linux-x64/bin/ltex-ls") },
    filetypes = { "markdown", "tex", "text" }
}
