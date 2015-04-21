dotfiles="$HOME/.dotfiles"

mkdir -p $dotfiles/vim/bundle
ln -s $dotfiles/vim ~/.vim
ln -s $dotfiles/vimrc ~/.vimrc
if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
  git clone git@github.com:gmarik/Vundle.vim.git $dotfiles/vim/bundle/Vundle.vim
fi
vim -u $dotfiles/vimrc.vundles +PluginInstall +PluginClean! +qa

ln -s $dotfiles/bash_profile ~/.bash_profile

ln -s $dotfiles/gitconfig ~/.gitconfig
ln -s $dotfiles/gitignore ~/.gitignore

ln -s $dotfiles/gemrc ~/.gemrc

