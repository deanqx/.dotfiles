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

    -- Autocompletion
    use 'hrsh7th/nvim-cmp' 
    use 'hrsh7th/cmp-nvim-lsp' 
    use 'hrsh7th/cmp-nvim-lsp-signature-help' 
    use 'L3MON4D3/LuaSnip' 

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
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('will133/vim-dirdiff')
    use('tpope/vim-commentary')

    use('prettier/vim-prettier')

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
