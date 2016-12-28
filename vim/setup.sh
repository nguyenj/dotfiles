#!/bin/bash

set -e

DOTFILES_ROOT=$(pwd -P)

# setup vim config
if [ ! -e $HOME/.vimrc ]; then
  echo "Symlink .vimrc"
  if [ ! -e $HOME/.vimrc ]; then
    ln -s $DOTFILES_ROOT/vim/vimrc $HOME/.vimrc
  fi

  echo "Setting up vim plugins directory"
  mkdir -pv $DOTFILES_ROOT/vim/vim/bundle
  if [ ! -d $HOME/.vim ]; then
    ln -s $DOTFILES_ROOT/vim/vim $HOME/.vim
  fi
  if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
    git clone git@github.com:gmarik/Vundle.vim.git $DOTFILES_ROOT/vim/vim/bundle/Vundle.vim
  fi

  echo "Installing vim plugins"
  vim +PluginInstall +PluginClean! +qall

  if [ ! -e $HOME/.vimrc_background ]; then
    echo "Setting up vim colorscheme"
    ln -s $DOTFILES_ROOT/vim/.vimrc_background $HOME/.vimrc_background
  fi
fi
