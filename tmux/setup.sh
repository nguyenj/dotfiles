#!/bin/bash

# When one command fails, exit immediately
set -e

# Ensure that variables are set, exit immediately otherwise
set -u

# Disable file globbing
set -f

# Let the pipe know if there's a failure
# set -o pipefail

DOTFILES_TMUX_ROOT=$(cd `dirname $0` && pwd)
CONFIG_ROOT=$HOME/.config

# Ensure tmux program exists
if ! [ -x "$(command -v tmux)" ]; then
  echo "    Downloading tmux v3"
  mkdir -p $CONFIG_ROOT/tmux
  cd $CONFIG_ROOT/tmux
  curl --location https://github.com/tmux/tmux/releases/download/3.0/tmux-3.0.tar.gz \
    --progress-bar \
    | \
    tar xz

  echo "    Building tmux"
  cd $CONFIG_ROOT/tmux/tmux-3.0
  ./configure && make
  make install
fi

# Check if .tmux.conf file exist
if [ ! -e $HOME/.tmux.conf ]; then
  # Create a symbolic link at .vimrc -> vimrc
  echo "Creating a symbolic link for .tmux.conf"
  ln -sf $DOTFILES_TMUX_ROOT/tmux.conf $HOME/.tmux.conf
fi
