path+=(
   "$HOME/.docker/bin"
)

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(mise activate zsh --shims)"

if [ -f "$ZDOTDIR/.zprofile.local.zsh" ]; then
  source "$ZDOTDIR/.zprofile.local.zsh"
fi
