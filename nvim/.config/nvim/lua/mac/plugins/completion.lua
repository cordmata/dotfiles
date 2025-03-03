return {
    {
        'saghen/blink.cmp',
        version = 'v0.*',
        dependencies = {
            'rafamadriz/friendly-snippets',
        },
        opts = {
            keymap = { preset = 'super-tab' },
            appearance = {
                nerd_font_variant = 'mono',
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
        },
    },
}
