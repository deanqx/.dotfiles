require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = true,
    custom_highlights = function(colors)
        return {
            ColorColumn = { bg = colors.mantle },
        }
    end,
})

vim.cmd.colorscheme "catppuccin-nvim"
