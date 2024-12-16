return {
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
}
