#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/.dotfiles"
[[ ! -d "$DOTFILES" ]] && echo "$DOTFILES not in expected location" && exit 1

BACKUP="$HOME/._dotfiles_backup"
rm -rf "$BACKUP"
mkdir -p "$BACKUP"

function backup() {
    cp -R "$1" "$BACKUP/" || echo "No existing $1"
}

EDITORCONFIG="$HOME/.editorconfig"
backup "$EDITORCONFIG"
ln -sf "$DOTFILES/editorconfig" "$EDITORCONFIG"

NVIM_DIR="$HOME/.config/nvim"
NVIM_INIT="$NVIM_DIR/init.lua"
NVIM_LUA="$NVIM_DIR/lua"
mkdir -p "$NVIM_LUA"
backup "$NVIM_INIT"
backup "$NVIM_LUA/mac"
ln -sf "$DOTFILES/config/nvim/init.lua" "$NVIM_INIT"
ln -sf "$DOTFILES/config/nvim/lua/mac" "$NVIM_LUA"

FISH_DIR="$HOME/.config/fish"
ln -sf "$DOTFILES/config/fish/config.fish" "$FISH_DIR/config.fish"

mkdir -p "$FISH_DIR/functions"
for fun in "$DOTFILES/config/fish/functions/"*
do
    ln -sf "$fun" "$FISH_DIR/functions/"
done

