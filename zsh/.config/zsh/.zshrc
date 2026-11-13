bindkey -e

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

autoload -Uz compinit
# Regenerate .zcompdump only once every 24 hours (-C skips security/fpath checks)
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' menu select

if [ -f "$ZDOTDIR/.zshrc.local.zsh" ]; then
  source "$ZDOTDIR/.zshrc.local.zsh"
fi
