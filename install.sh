#!/usr/bin/env bash

mkdir -p ~/.dotfiles_backup
cd ~

function symlinkifne {

  if [[ -e $1 ]]; then
    # file exists

    if [[ -L $1 ]]; then
      # it's already a simlink, assume from this proj
      echo "simlink $1 exists, skipped"
      return
    else
      mv $1 ~/.dotfiles_backup/
      echo "backed up existing $1 ..."
    fi
  fi
  # create the link
  ln -s ~/.dotfiles/$1 $1
  echo "linked $1"
}

symlinkifne .gitconfig
symlinkifne .tmux.conf
symlinkifne .vim
symlinkifne .vimrc
symlinkifne .editorconfig

mkdir -p ~/.config/nvim
symlinkifne .config/nvim/init.vim

mkdir -p ~/.config/fish
symlinkifne .config/fish/config.fish
