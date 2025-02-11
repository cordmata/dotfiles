return  {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        config = function()
            require("fzf-lua").setup {
                winopts = {
                    preview = { hidden = true },
                },
                files = { follow = true }
            }
            require("fzf-lua").register_ui_select()
        end
    },
}
