local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
    'mattn/emmet-vim',
    'editorconfig/editorconfig-vim',
    'mbbill/undotree',
    'mfussenegger/nvim-dap',
    'RRethy/nvim-base16',
    'direnv/direnv.vim',

    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',     -- git browse for Github
    'tommcdo/vim-fubitive',  -- git browse for Bitbucket
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require("gitsigns").setup {}
        end
    },

    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup()
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        cmd = 'TSUpdate',
        config = function()
            require("nvim-treesitter.configs").setup({
                ensured_installed = {
                    "bash",
                    "comment",
                    "css",
                    "html",
                    "javascript",
                    "jsdoc",
                    "jsonc",
                    "lua",
                    "markdown",
                    "regex",
                    "scss",
                    "toml",
                    "typescript",
                    "yaml",
                    "rust",
                    "python",
                    "go",
                    "java",
                    "kotlin",
                    "groovy",
                    "fish",
                },
                highlight = {
                    enable = true,
                },
            })
        end
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require("telescope").setup {}
        end
    },

    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to  the default settings
                -- refer to the configuration section below
            }
        end
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        }
    },

}

require("lazy").setup(plugins, {})


