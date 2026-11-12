export EDITOR="nvim"
export PAGER="less -R"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep.conf"
export UV_SYSTEM_CERTS="true"

if [ -f "$ZDOTDIR/.zshenv.local.zsh" ]; then
  source "$ZDOTDIR/.zshenv.local.zsh"
fi
