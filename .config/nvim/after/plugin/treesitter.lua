require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "vimdoc", "javascript", "rust", "c", "lua", "vim", "query", "java" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
        disable = { "latex" },
    },
}
