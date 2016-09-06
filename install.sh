#!/usr/bin/env bash

DOTFILES_ROOT=$(pwd -P)

# # Linking .zshrc
# cd $DOTFILES_ROOT/zsh/
# sh zsh.sh

# Setup bashrc
if [ ! -e $HOME/.bashrc ]; then
  echo "Linking .bashrc..."
  ln -s $DOTFILES_ROOT/bash/bashrc $HOME/.bashrc
fi

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

# setup vim config
if [ ! -e ~/.vimrc ]; then
  echo "Setting up vim"
  mkdir -pv $DOTFILES_ROOT/vim/vim/bundle
  if [ ! -d ~/.vim ]; then
    ln -s $DOTFILES_ROOT/vim/vim ~/.vim
  fi
  if [ ! -e ~/.vimrc ]; then
    ln -s $DOTFILES_ROOT/vim/vimrc ~/.vimrc
  fi
  if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
    git clone git@github.com:gmarik/Vundle.vim.git $DOTFILES_ROOT/vim/vim/bundle/Vundle.vim
  fi
  vim +PluginInstall +PluginClean! +qall
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
