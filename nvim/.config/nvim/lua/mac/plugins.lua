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
    'github/copilot.vim',

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
            require("telescope").setup {
                defaults = {
                    mappings = {
                        n = {
                            ['<c-d>'] = require('telescope.actions').delete_buffer
                        },
                        i = {
                            ['<c-d>'] = require('telescope.actions').delete_buffer
                        }
                    }
                },
            }
        end
    },

    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
        config = function()
            require('trouble').setup {}
        end
    },

    {
        "neovim/nvim-lspconfig",
        config = function() end
    },

    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup {}
        end
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "c",
                    "fish",
                    "go",
                    "gomod",
                    "gotmpl",
                    "groovy",
                    "hcl",
                    "html",
                    "java",
                    "javascript",
                    "json",
                    "kotlin",
                    "lua",
                    "python",
                    "terraform",
                    "toml",
                    "typescript",
                    "vim",
                    "vimdoc",
                    "xml",
                    "yaml",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
}

require("lazy").setup(plugins, {})

