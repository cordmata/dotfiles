return  {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        config = function()
            local fzf = require('fzf-lua')
            fzf.setup {
                winopts = {
                    preview = { hidden = true },
                },
                files = { follow = true },
                grep = {
                    rg_opts = "\z
                        --hidden \z
                        --glob=!.git/* \z
                        --glob=!node_modules/* \z
                        --glob=!pnpm-lock.yaml \z
                        --glob=!package-lock.json \z
                        --column \z
                        --line-number \z
                        --no-heading \z
                        --color=always \z
                        --smart-case \z
                        --max-columns=4096 \z
                        -e"
                },
            }
            fzf.register_ui_select()
        end
    },
}
