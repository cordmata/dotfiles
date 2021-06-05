#!/usr/bin/env bash
mkdir -p ~/.dotfiles_backup
cd ~

function link_if_needed {

  if [[ -e $1 ]]; then
    # file exists

    if [[ -L $1 ]]; then
      # it's already a simlink, assume from this proj
      echo "simlink $1 exists, skipped"
      return
    else
      mkdir -p "~/.dotfiles_backup/$(dirname $1)"
      mv $1 "~/.dotfiles_backup/${1}"
      echo "backed up existing $1 ..."
    fi
  fi
  # create the link
  ln -s ~/.dotfiles/$1 $1
  echo "linked $1"
}

link_if_needed .gitconfig
link_if_needed .tmux.conf
link_if_needed .vim
link_if_needed .vimrc
link_if_needed .editorconfig

mkdir -p ~/.config/nvim
link_if_needed .config/nvim/init.vim

mkdir -p ~/.config/fish/functions
link_if_needed .config/fish/config.fish
for f in ~/.dotfiles/.config/fish/functions/*.fish
do
  link_if_needed ".config/fish/functions/$(basename $f)"
done
