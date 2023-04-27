-- ensure the packer plugin manager is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'mattn/emmet-vim'
  use 'editorconfig/editorconfig-vim'
  use 'nvim-lualine/lualine.nvim'
  use 'mbbill/undotree'
  use 'nvim-lua/popup.nvim'
  use {
	  'nvim-telescope/telescope.nvim',
	  requires = 'nvim-lua/plenary.nvim'
  }
  use 'mfussenegger/nvim-dap'
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
  end}

  use 'tpope/vim-fugitive'

  use {
      "folke/trouble.nvim",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
        end
  }

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  'neovim/nvim-lspconfig',
		  'williamboman/mason.nvim',
		  'williamboman/mason-lspconfig.nvim',

		  -- Autocompletion
		  'hrsh7th/nvim-cmp',
		  'hrsh7th/cmp-buffer',
		  'hrsh7th/cmp-path',
		  'saadparwaiz1/cmp_luasnip',
		  'hrsh7th/cmp-nvim-lsp',
		  'hrsh7th/cmp-nvim-lua',

		  -- Snippets
		  'L3MON4D3/LuaSnip',
		  'rafamadriz/friendly-snippets',
	  }
  }

  use 'tpope/vim-rhubarb'     -- git browse for Github
  use 'tommcdo/vim-fubitive'  -- git browse for Bitbucket
  use 'lewis6991/gitsigns.nvim'

  -- Colors & Themes
  use 'RRethy/nvim-base16'

end)

