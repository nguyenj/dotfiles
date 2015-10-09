dotfiles="$HOME/.dotfiles"

# setup vim
mkdir -pv $dotfiles/vim/bundle
ln -s $dotfiles/vim ~/.vim
ln -s $dotfiles/vimrc ~/.vimrc
if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
  git clone git@github.com:gmarik/Vundle.vim.git $dotfiles/vim/bundle/Vundle.vim
fi
vim +PluginInstall +PluginClean! +qall