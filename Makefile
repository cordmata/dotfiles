deps:
	brew install stow neovim fish fzf ripgrep bat starship

install:
	mkdir -p "${HOME}/bin"
	mkdir -p "${HOME}/.config/nvim/lua"
	stow nvim

	mkdir -p "${HOME}/.config/fish/functions"
	mkdir -p "${HOME}/.config/fish/conf.d"
	stow fish

	stow editorconfig

	stow vault
	echo "token_helper = \"${HOME}/bin/vault-token-helper\"" >> "$$HOME/.vault"

.phony: install deps
