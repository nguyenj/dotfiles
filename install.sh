dotfiles="$HOME/.dotfiles"

mkdir -p $dotfiles/vim/bundle
ln -s $dotfiles/vim ~/.vim
git clone git@github.com:gmarik/Vundle.vim.git $dotfiles/vim/bundle/Vundle.vim
ln -s $dotfiles/vimrc ~/.vimrc

ln -s $dotfiles/bash_profile ~/.bash_profile

ln -s $dotfiles/gitconfig ~/.gitconfig
ln -s $dotfiles/gitignore ~/.gitignore

ln -s $dotfiles/gemrc ~/.gemrc

