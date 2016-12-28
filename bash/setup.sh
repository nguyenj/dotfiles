#!/bin/bash

set -e

DOTFILES_ROOT=$(pwd -P)

# git download base16 shell colors into ~/.config
if [ ! -e $HOME/.config/base16-shell ]; then
  echo "Downloading base16-shell"
  git clone https://github.com/chriskempson/base16-shell.git $HOME/.config/base16-shell

  if [ ! -e $HOME/.base16_theme ]; then
    echo "Configure shell colorscheme to tomorrow-night"
    ln -s $HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh $HOME/.base16_theme
  fi
fi

# Symlink bashrc
if [ ! -e $HOME/.bashrc ]; then
  echo "Linking .bashrc..."
  ln -s $DOTFILES_ROOT/bash/bashrc $HOME/.bashrc
fi

# setup tat for tmux
if [ ! -e $HOME/.config/tat ]; then
  echo "Installing tat for tmux"
  curl -L https://github.com/ryandotsmith/tat/archive/master.tar.gz | tar xvf - -C $HOME/.config/
fi
