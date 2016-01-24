dotfiles="$HOME/.dotfiles"

# setup tmux
echo "Setting up tmux"
ln -s $dotfiles/tmux ~/.tmux.conf

# setup vim config
echo "Setting up vim"
mkdir -pv $dotfiles/vim/bundle
if [ ! -d ~/.vim ]; then
  ln -s $dotfiles/vim ~/.vim
fi
if [ ! -e ~/.vimrc ]; then
  ln -s $dotfiles/vimrc ~/.vimrc
fi
if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
  git clone git@github.com:gmarik/Vundle.vim.git $dotfiles/vim/bundle/Vundle.vim
fi
vim +PluginInstall +PluginClean! +qall

# setup git config
echo "Setting up git"
ln -s $dotfiles/gitconfig ~/.gitconfig
ln -s $dotfiles/gitignore ~/.gitignore
ln -s $dotfiles/git-prompt-colors ~/.git-prompt-colors.sh
ln -s $dotfiles/git_diff_wrapper.sh ~/.git_diff_wrapper.sh

# setup silversearch ignore file (ag)
echo "Setting up ag"
ln -s $dotfiles/agignore ~/.agignore

# setup bash config
echo "Setting up bash"
ln -s $dotfiles/inputrc ~/.inputrc
