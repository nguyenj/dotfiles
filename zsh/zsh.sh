ZSH_ROOT=$(pwd -P)

if [ -n "$(which zsh)" ]; then
  # install antigen (plugin manager for zsh)
  if [ ! -d $ZSH_ROOT/scripts/antigen ]; then
    echo "Installing antigen..."
    git clone https://github.com/zsh-users/antigen.git $ZSH_ROOT/scripts/antigen

  else
    echo "Updating antigen..."
    cd $ZSH_ROOT/scripts/antigen
    git pull --rebase
  fi

  if [ ! -e ~/.zshrc ]; then
    echo "Linking .zshrc..."
    ln -s $ZSH_ROOT/zshrc $HOME/.zshrc
  fi
fi
