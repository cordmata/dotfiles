deps:
	brew install stow neovim fish fzf fd ripgrep bat starship zoxide jesseduffield/lazygit/lazygit

install:
	touch "${HOME}/.hushlogin"
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
	git config --global init.defaultBranch 'main'

	stow editorconfig
	stow intellij
	stow starship
	stow kitty
	stow lazygit
	stow ripgrep

	mkdir -p "${HOME}/.config/ghostty"
	stow ghostty

	mkdir -p "${HOME}/.config/fd"
	stow fd

	stow vault
	echo "token_helper = \"${HOME}/bin/vault-token-helper\"" >> "$$HOME/.vault"

.phony: install deps
