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

alias gfa="git fetch --all --prune --jobs=10"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

autoload -Uz abbr
abbr gst="git status" tf="terraform"
abbr dstop='docker stop $(docker ps -aq)'

if ((${+aliases[run-help]})); then unalias run-help; fi
autoload -Uz run-help
alias help='run-help'

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

if [ -f "$HOME/.zshrc.local.zsh" ]; then
  source "$HOME/.zshrc.local.zsh"
fi
