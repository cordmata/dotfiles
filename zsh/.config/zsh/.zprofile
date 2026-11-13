
export ZSH_COMP_DIR="$HOME/.local/share/zsh/site-functions"

fpath+=(
    "$ZSH_COMP_DIR"
    "$XDG_CONFIG_HOME/zsh/functions"
)

path+=(
    "/usr/local/bin"
    "/usr/local/sbin"
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
    "$HOME/Library/pnpm/bin"
    "$HOME/.cargo/bin"
    "$HOME/.docker/bin"
    "$HOME/.local/bin"
    "$HOME/.local/share/mise/shims"
    "$HOME/bin"
)

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(mise activate zsh --shims)"

if [ -f "$ZDOTDIR/.zprofile.local.zsh" ]; then
  source "$ZDOTDIR/.zprofile.local.zsh"
fi
