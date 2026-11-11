path+=(
   "$HOME/.docker/bin"
)

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(mise activate zsh --shims)"

if [ -f "$HOME/.zprofile.local.zsh" ]; then
  source "$HOME/.zprofile.local.zsh"
fi
