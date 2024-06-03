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
    'editorconfig/editorconfig-vim',
    'RRethy/nvim-base16',
    'tpope/vim-fugitive',
    'tpope/vim-commentary',
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
            require('lualine').setup {}
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
        "neovim/nvim-lspconfig",
        config = function() end
    },

    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup {}
        end
    },
}

require("lazy").setup(plugins, {})

