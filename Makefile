deps:
	brew install stow neovim fish fzf ripgrep bat starship

install:
	mkdir -p "${HOME}/.config/nvim/lua"
	stow nvim

	mkdir -p "${HOME}/.config/fish/functions"
	mkdir -p "${HOME}/.config/fish/conf.d"
	stow fish

	stow editorconfig


.phony: install deps
