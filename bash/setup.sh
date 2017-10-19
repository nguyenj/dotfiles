#!/bin/bash

set -e

DOTFILES_BASH_ROOT=$(pwd -P)
CONFIG_DIR=$HOME/.config

# git download base16 shell colors into ~/.config
if [ ! -e $HOME/.config/base16-shell ]; then
  echo "Downloading base16-shell"
  git clone https://github.com/chriskempson/base16-shell.git $HOME/.config/base16-shell

  if [ ! -e $HOME/.base16_theme ]; then
    echo "Configuring shell base16 colorschemee"
    ln -svf $HOME/.config/base16-shell/scripts/base16-harmonic-dark.sh $HOME/.base16_theme
  fi
fi

# Symlink bashrc
if [ ! -e $HOME/.bashrc ]; then
  echo "Linking .bashrc..."
  ln -s $DOTFILES_BASH_ROOT/bashrc $HOME/.bashrc
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

# Setup nvm for node version management
if [ ! -e $CONFIG_DIR/nvm ]; then
  echo "Downloading nvm from github"
  git clone https://github.com/creationix/nvm.git $CONFIG_DIR/nvm
  cd $CONFIG_DIR/nvm && sh install.sh
fi

# Setup fzf
if [ ! -e $HOME/.fzf ]; then
  echo "Downloading fzf from github"
  git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
  $HOME/.fzf/install
fi
