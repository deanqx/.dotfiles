vim.lsp.config.ltex = {
    cmd = { vim.fn.expand("~/.local/share/nvim/language_servers/ltex-ls-16.0.0/bin/ltex-ls") },
    filetypes = { "markdown", "tex", "text" }
}

vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
    aux_dir = 'aux',
    background = 1,
    build_method = 'continuous',
    latexmk_biber = 1,
}
