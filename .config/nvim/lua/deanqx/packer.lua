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

    -- Theme
    use 'navarasu/onedark.nvim'

    -- LSP Package manager
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- LSP Support
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'neovim/nvim-lspconfig'

    use {
        'mfussenegger/nvim-dap',
        requires = {
            { 'igorlfs/nvim-dap-view' },
            { 'mfussenegger/nvim-jdtls' },
        }
    }

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'L3MON4D3/LuaSnip'

    -- file exploring
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use({
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    })
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    -- git view
    use('tpope/vim-fugitive')

    -- formating
    use('prettier/vim-prettier')

    use('tpope/vim-sleuth')
    use('tpope/vim-commentary')

    -- latex LSP
    use {
        'lervag/vimtex',
        lazy = false,
    }


    use('mbbill/undotree')
    use('will133/vim-dirdiff')

    -- stop bad vim habits
    use {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {},
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
