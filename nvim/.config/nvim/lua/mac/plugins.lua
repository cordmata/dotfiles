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
    'neovim/nvim-lspconfig',

    {
        'nvim-lualine/lualine.nvim',
        opts = {},
    },

    {
        'lewis6991/gitsigns.nvim',
        opts = {},
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
           require("telescope").setup({
                defaults = require('telescope.themes').get_ivy()
            })
        end
    },

    {
        "folke/trouble.nvim",
        opts = {},
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
    },

    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            require("nvim-treesitter.configs").setup({
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
                modules = {},
                ignore_install = {},
                auto_install = true,
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },

    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    { -- optional cmp completion source for require statements and module annotations
        "hrsh7th/nvim-cmp",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lsp-document-symbol',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                  expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                  end,
                },
                window = {
                  completion = cmp.config.window.bordered(),
                  documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                  ['<C-f>'] = cmp.mapping.scroll_docs(4),
                  ['<C-Space>'] = cmp.mapping.complete(),
                  ['<C-e>'] = cmp.mapping.abort(),
                  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lsp_document_symbol' },
                    { name = 'nvim_lsp_signature_help' },
                    { name = 'vsnip' },
                    {
                        name = "lazydev",
                        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
                    }
                }, {
                  { name = 'buffer' },
                })
            })
        end,
    },
}

require("lazy").setup(plugins, {})

