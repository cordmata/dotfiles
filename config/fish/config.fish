set -Ux EDITOR vim
set -Ux FZF_DEFAULT_COMMAND 'rg --files'
set -Ux PAGER less
set -Ux VAULT_SKIP_VERIFY 1
set -Ux LENS_DISABLE_GPU true
set -Ux XDG_CONFIG_HOME "$HOME/.config"

fish_add_path $HOME/.maven/bin $HOME/.cargo/bin $HOME/go/bin $HOME/.local/bin $HOME/bin /usr/local/sbin /usr/local/bin

if type -q nvim
  alias vim='nvim'
end

alias vi=vim
alias ls="ls -G"

abbr -a f open -a Finder ./
abbr -a conf code ~/.config/fish
abbr -a gw ./gradlew
abbr -a tf terraform
abbr -a tfp terraform plan
abbr -a tfpo terraform plan -out plan
abbr -a tfsl terraform state list
abbr -a tfsh terraform show
abbr -a tg terragrunt
abbr -a dstop 'docker stop (docker ps -aq)'
abbr -a kc kubectl
abbr -a kcc kubectl config unset current-context
abbr -a chns kubectl config set-context --current=true --namespace=
abbr -a tunnel ssh -nNT -L 5432:[RDS endpoint]:5432 jumphost

abbr -a gfa git fetch --all --prune --jobs=10
abbr -a gb git branch
abbr -a gco git checkout
abbr -a gcd git checkout develop
abbr -a gcm git checkout master
abbr -a gcma git checkout main
abbr -a glg git log --oneline --all --graph
abbr -a gst git status
abbr -a gsw git switch
abbr -a gswc git switch -c

abbr -a da direnv allow

function theme
    set _theme (functions | grep base16- | fzf)
    $_theme
end

source /usr/local/opt/fzf/shell/key-bindings.fish && fzf_key_bindings

function code --argument opendir
    if test -z $opendir
        set opendir (ls -d $HOME/code/* | fzf)
    end
    command code $opendir
end

function fish_greeting
end

starship init fish | source
