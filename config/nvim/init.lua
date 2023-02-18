vim.g.mapleader = " "
vim.cmd('colorscheme tokyonight-storm')

require("mac.options")
require("mac.plugins")
require("mac.keymaps")
require("mac.lsp")

require("mac.plugins.lualine")
require("mac.plugins.gitsigns")
require("mac.plugins.telescope")

pcall(require, "local")

