bindkey -e

fpath+=(
    "$HOME/.local/share/zsh/site-functions"
    "$XDG_CONFIG_HOME/zsh/functions"
)

path+=(
    "/usr/local/bin"
    "/usr/local/sbin"
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
    "$HOME/Library/pnpm/bin"
    "$HOME/.cargo/bin"
    "$HOME/.local/bin"
    "$HOME/.local/share/mise/shims"
    "$HOME/bin"
)

alias ls="ls -G"
alias cat="bat"
alias vim="nvim"
alias cd="z"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

autoload -Uz abbr

abbr tf="terraform"
abbr dstop='docker stop $(docker ps -aq)'

abbr gco="git switch"
abbr gst="git status"
abbr gfa="git fetch --all --prune --jobs=10"

if ((${+aliases[run-help]})); then unalias run-help; fi
autoload -Uz run-help
alias help='run-help'

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

if [ -f "$ZDOTDIR/.zshrc.local.zsh" ]; then
  source "$ZDOTDIR/.zshrc.local.zsh"
fi
