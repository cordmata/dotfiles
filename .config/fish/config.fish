set -Ux EDITOR vim
set -Ux FZF_DEFAULT_COMMAND 'rg --files'
set -Ux GOPATH $HOME/go
set -Ux PAGER less
set -Ux VAULT_SKIP_VERIFY 1

fish_add_path $HOME/.local/bin $HOME/bin /usr/local/sbin /usr/local/bin

if type -q nvim
  alias vim='nvim'
end

alias vi=vim
alias ls="ls -G"

abbr -a f open -a Finder ./
abbr -a gw ./gradlew
abbr -a tf terraform
abbr -a tg terragrunt
abbr -a dstop 'docker stop (docker ps -aq)'
abbr -a kc kubectl

abbr -a gfa git fetch --all --prune --jobs=10
abbr -a gc git checkout
abbr -a gcd git checkout develop
abbr -a gcm git checkout master
abbr -a gsw git switch
abbr -a gswc git switch -c

source /usr/local/opt/fzf/shell/key-bindings.fish && fzf_key_bindings
fish_ssh_agent
starship init fish | source
