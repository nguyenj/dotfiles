dotfiles="$HOME/.dotfiles"

# setup tmux
ln -s $dotfiles/tmux ~/.tmux.conf

# setup vim config
mkdir -pv $dotfiles/vim/bundle
ln -s $dotfiles/vim ~/.vim
ln -s $dotfiles/vimrc ~/.vimrc
if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
  git clone git@github.com:gmarik/Vundle.vim.git $dotfiles/vim/bundle/Vundle.vim
fi
vim +PluginInstall +PluginClean! +qall

# setup git config
ln -s $dotfiles/gitconfig ~/.gitconfig
ln -s $dotfiles/gitignore ~/.gitignore
ln -s $dotfiles/git-prompt-colors ~/.git-prompt-colors.sh
