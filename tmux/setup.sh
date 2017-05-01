#!/bin/bash

set -e

DOTFILES_BASH_ROOT=$(pwd -P)

# Setup tmux
if [ ! -e $HOME/.config/tmux ]; then
  echo "Installing tmux"
  cd $HOME/.config
  git clone https://github.com/tmux/tmux.git
  cd tmux
  sh autogen.sh
  ./configure && make
  mkdir -p bin
  mv tmux ./bin
fi

cd $DOTFILES_BASH_ROOT

# Setup tat for tmux
if [ ! -e $HOME/.config/tat-master ]; then
  echo "Installing tat for tmux"
  curl -L https://github.com/ryandotsmith/tat/archive/master.tar.gz | tar xvf - -C $HOME/.config/
fi
