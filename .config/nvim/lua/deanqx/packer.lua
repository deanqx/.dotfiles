local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use 'navarasu/onedark.nvim'

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('mbbill/undotree')
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use('tpope/vim-fugitive')
    use('will133/vim-dirdiff')
    use('tpope/vim-commentary')
    use('prettier/vim-prettier')

    use {
        'lervag/vimtex',
        lazy = false,
        config = function()
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_compiler_method = 'latexmk'
            vim.g.vimtex_compiler_latexmk = {
                background = 1,
                build_method = 'continuous',
                latexmk_biber = 1,
            }
        end
    }

    use {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {},
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
