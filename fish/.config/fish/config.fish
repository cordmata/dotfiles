set -gx EDITOR nvim
set -gx PAGER less -r
set -gx VAULT_SKIP_VERIFY 1
set -gx LENS_DISABLE_GPU true
set -gx XDG_CONFIG_HOME "$HOME/.config"

fish_add_path '/Applications/Visual Studio Code.app/Contents/Resources/app/bin' '/Applications/IntelliJ IDEA.app/Contents/MacOS' /opt/homebrew/bin /opt/homebrew/sbin $HOME/.maven/bin $HOME/.cargo/bin $HOME/go/bin $HOME/.local/bin $HOME/bin /usr/local/sbin /usr/local/bin

if type -q nvim
  abbr -a vim nvim
end

if type -q bat
  abbr -a cat bat
end

if type -q lazygit
  abbr -a lg lazygit
end

abbr -a ef exec fish

alias ls="ls -G"

abbr -a f open -a Finder ./
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

function theme
    set _theme (functions | grep base16- | fzf)
    $_theme
end

# open a directory in $HOME/code with vscode using a fuzzy finder
function co
  set code_dir "$HOME/code"
  pushd "$code_dir"
  set _dir (ls "$code_dir" | fzf)
  code "$_dir"
  popd
end

# open a directory in $HOME/code in neovim using a fuzzy finder
function v
  set code_dir "$HOME/code"
  cd "$code_dir"
  cd (ls | fzf)
  nvim .
end

starship init fish | source

export FZF_CTRL_T_COMMAND="fd --hidden --exclude '.git' --exclude 'node_modules' --max-depth 1 --type d"
export FZF_ALT_C_COMMAND="fd --hidden --exclude '.git' --exclude 'node_modules' --max-depth 1 --type d"
function fish_user_key_bindings
    fzf_key_bindings
end
