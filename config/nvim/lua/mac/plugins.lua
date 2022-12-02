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
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'mfussenegger/nvim-dap'
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
  end}

  -- Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'     -- git browse for Github
  use 'tommcdo/vim-fubitive'  -- git browse for Bitbucket
  use 'lewis6991/gitsigns.nvim'

  -- Colors & Themes
  use 'folke/tokyonight.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'haishanh/night-owl.vim'
  use 'shaunsingh/solarized.nvim'
  use 'shaunsingh/nord.nvim'

end)
