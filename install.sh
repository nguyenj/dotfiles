#!/bin/bash

# When one command fails, exit immediately
set -e

# Ensure that variables are set, exit immediately otherwise
set -u

# Disable file globbing
set -f

# Let the pipe know if there's a failure
# set -o pipefail

DOTFILES_ROOT=$(cd `dirname $0` && pwd)

# Ensure $HOME/.config exists
if [ ! -d $HOME/.config ]; then
  echo "    Creating .config directory"
  mkdir -p $HOME/.config
fi

CONFIG_ROOT=$HOME/.config

# Setup vim
sh $DOTFILES_ROOT/vim/setup.sh

# Set .editorconfig globally
# Check if .editorconfig exist
if [ ! -e $HOME/.editorconfig ]; then
  echo "    Creating a symbolic link for .editorconfig"
  ln -sf $DOTFILES_ROOT/.editorconfig $HOME/.editorconfig
fi

# Setup tmux
sh $DOTFILES_ROOT/tmux/setup.sh

# Set .inputrc globally
if [ ! -e $HOME/.inputrc ]; then
  echo "    Creating a symbolic link for .inputrc"
  ln -sf $DOTFILES_ROOT/inputrc $HOME/.inputrc
fi
