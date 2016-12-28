#!/usr/bin/env bash

DOTFILES_ROOT=$(pwd -P)

# setup homebrew
cd $DOTFILES_ROOT/homebrew
sh brew.sh

# setup ctags
if [ ! -e $HOME/.ctags ]; then
  echo "Linking .ctags..."
  ln -s $DOTFILES_ROOT/ctags/ctags $HOME/.ctags
fi

# setup tmux
if [ ! -e $HOME/.tmux.conf ]; then
  echo "Linking .tmux.conf..."
  ln -s $DOTFILES_ROOT/tmux/tmux.conf $HOME/.tmux.conf
fi

# # setup git config
# echo "Setting up git"
# ln -s $DOTFILES_ROOT/gitconfig ~/.gitconfig
# ln -s $DOTFILES_ROOT/gitignore ~/.gitignore
# ln -s $DOTFILES_ROOT/git-prompt-colors ~/.git-prompt-colors.sh
# ln -s $DOTFILES_ROOT/git_diff_wrapper.sh ~/.git_diff_wrapper.sh
# 
# # setup silversearch ignore file (ag)
# echo "Setting up ag"
# ln -s $DOTFILES_ROOT/agignore ~/.agignore
# 
# # setup bash config
# echo "Setting up bash"
# ln -s $DOTFILES_ROOT/inputrc ~/.inputrc
