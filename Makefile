deps:
	brew install stow neovim fish fzf fd ripgrep bat starship font-symbols-only-nerd-font font-fira-code

install:
	mkdir -p "${HOME}/bin"
	mkdir -p "${HOME}/.config/nvim/lua"
	stow nvim

	mkdir -p "${HOME}/.config/fish/functions"
	mkdir -p "${HOME}/.config/fish/conf.d"
	stow fish

	stow git
	git config --global core.excludesFile "$$HOME/.gitignore_global"
	git config --global core.editor 'nvim'
	git config --global push.default 'simple'
	git config --global color.ui 'true'
	git config --global pull.rebase 'false'
	git config --global user.name 'Matt Cordial'

	stow editorconfig
	stow intellij
	stow starship

	stow vault
	echo "token_helper = \"${HOME}/bin/vault-token-helper\"" >> "$$HOME/.vault"

.phony: install deps
