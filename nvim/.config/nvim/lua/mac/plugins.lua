vim.cmd.packadd("nvim.undotree")
vim.pack.add  {
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
    { src = 'https://github.com/editorconfig/editorconfig-vim' },
    { src = 'https://github.com/RRethy/nvim-base16' },
    { src = 'https://github.com/sindrets/diffview.nvim' },
    { src = 'https://github.com/tpope/vim-fugitive' },
    { src = 'https://github.com/tpope/vim-commentary' },
    { src = 'https://github.com/tpope/vim-surround' },
    { src = 'https://github.com/tommcdo/vim-fubitive' },  -- git browse for Bitbucket
    { src = 'https://github.com/tpope/vim-rhubarb' },     -- git browse for Github
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/stevearc/oil.nvim' },
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/rafamadriz/friendly-snippets' },
    {
        src = 'https://github.com/saghen/blink.cmp',
        version = "v1",
    },
    { src = 'https://github.com/ibhagwan/fzf-lua' },
}

if (vim.env.base16_fish_shell_background == 'dark') then
    vim.cmd("colorscheme base16-catppuccin-frappe")
else
    vim.cmd("colorscheme base16-catppuccin-latte")
end

require("lualine").setup()
require("oil").setup()

local cmp = require('blink.cmp')
cmp.setup({
    keymap = { preset = 'super-tab' },
    appearance = {
        nerd_font_variant = 'mono',
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
})

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

require("nvim-treesitter").setup({
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
