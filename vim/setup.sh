#!/bin/bash

# When one command fails, exit immediately
set -e

# Ensure that variables are set, exit immediately otherwise
set -u

# Disable file globbing
set -f

# Let the pipe know if there's a failure
# set -o pipefail

DOTFILES_VIM_ROOT=$(cd `dirname $0` && pwd)

# Check if .vimrc file exist
if [ ! -e $HOME/.vimrc ]; then
  # Create a symbolic link at .vimrc -> vimrc
  echo "Creating a symbolic link for .vimrc"
  ln -sf $DOTFILES_VIM_ROOT/vimrc $HOME/.vimrc
fi

# Check if .vim directory exist
if [ ! -d $HOME/.vim ]; then
  mkdir -p $HOME/.vim
fi

# Check if .vim/pack directory exist
if [ ! -d $HOME/.vim/pack ]; then
  mkdir -p $HOME/.vim/pack
fi

# Check if .vim/pack/plugins directory exist
if [ ! -d $HOME/.vim/pack/plugins ]; then
  echo "Setting up vim plugins directory"
  mkdir -p $HOME/.vim/pack/plugins

  # Create .vim and create a symbolic link to plugins
  # .vim/pack/plugins/start -> vim/plugins
  ln -sfn $DOTFILES_VIM_ROOT/plugins $HOME/.vim/pack/plugins/start
fi
