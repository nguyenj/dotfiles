#!/bin/bash

set -e

DOTFILES_ROOT=$(pwd -P)

# git download base16 shell colors into ~/.config
if [ ! -e $HOME/.config/base16-shell ]; then
  echo "Downloading base16-shell"
  git clone https://github.com/chriskempson/base16-shell.git $HOME/.config/base16-shell

  if [ ! -e $HOME/.base16_theme ]; then
    echo "Configuring shell base16 colorschemee"
    ln -s $HOME/.config/base16-shell/scripts/base16-default-light.sh $HOME/.base16_theme
  fi
fi

# Symlink bashrc
if [ ! -e $HOME/.bashrc ]; then
  echo "Linking .bashrc..."
  ln -s $DOTFILES_ROOT/bash/bashrc $HOME/.bashrc
fi

# Setup tat for tmux
if [ ! -e $HOME/.config/tat-master ]; then
  echo "Installing tat for tmux"
  curl -L https://github.com/ryandotsmith/tat/archive/master.tar.gz | tar xvf - -C $HOME/.config/
fi

# Setup matcher (vim ctrlp)
if [ ! -e $HOME/.config/matcher-1.0.0 ]; then
  echo "Install matcher for vim ctrlp"
  curl -L https://github.com/burke/matcher/archive/1.0.0.tar.gz | tar xvf - -C $HOME/.config/
  cd $HOME/.config/matcher-1.0.0 && make && make install
fi

# Setup tig for git shell interface
if [ ! -e $HOME/.config/tig-2.2.1 ]; then
  curl -L https://github.com/jonas/tig/releases/download/tig-2.2.1/tig-2.2.1.tar.gz | tar xvf - -C $HOME/.config/
  cd $HOME/.config/tig-2.2.1 && make prefix=/usr/local && make install prefix=/usr/local
fi
