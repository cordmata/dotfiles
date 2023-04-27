vim.g.mapleader = " "

require("mac.options")
require("mac.plugins")
require("mac.keymaps")
require("mac.lsp")

require("mac.plugins.lualine")
require("mac.plugins.telescope")

pcall(require, "local")

