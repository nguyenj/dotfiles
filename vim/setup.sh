#!/bin/bash

set -e

DOTFILES_VIM_ROOT=$(pwd -P)

# setup vim config
if [ ! -e $HOME/.vimrc ]; then
  echo "Symlink .vimrc"
  if [ ! -e $HOME/.vimrc ]; then
    ln -s $DOTFILES_VIM_ROOT/vimrc $HOME/.vimrc
  fi

  echo "Setting up vim plugins directory"
  if [ ! -d $HOME/.vim ]; then
    ln -s $DOTFILES_VIM_ROOT/vim $HOME/.vim
  fi
fi
