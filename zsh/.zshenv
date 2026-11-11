export EDITOR="nvim"
export PAGER="less -R"
export XDG_CONFIG_HOME="$HOME/.config"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep.conf"
export UV_SYSTEM_CERTS="true"

if [ -f "$HOME/.zshenv.local.zsh" ]; then
  source "$HOME/.zshenv.local.zsh"
fi
