-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'folke/tokyonight.nvim'

    use 'nvim-lua/plenary.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
    }

    use 'ThePrimeagen/vim-be-good'

    use {
        'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    }

    use 'nvim-treesitter/nvim-treesitter-refactor'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- nvim-cmp
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- lsp management
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- formatters
    use 'jose-elias-alvarez/null-ls.nvim'

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- debugging
    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    -- copilot
    -- use 'github/copilot.vim'

    -- emmet
    use 'mattn/emmet-vim'

    -- harpoon
    use 'ThePrimeagen/harpoon'

    -- auto tags
    use 'windwp/nvim-ts-autotag'

    -- Java LSP (JDTLS)
    use 'mfussenegger/nvim-jdtls'
end)
