#!/bin/bash

# When one command fails, exit immediately
set -e

# Ensure that variables are set, exit immediately otherwise
set -u

# Disable file globbing
set -f

# Let the pipe know if there's a failure
set -o pipefail

DOTFILES_ROOT=$(cd `dirname $0` && pwd)

sh $DOTFILES_ROOT/vim/setup.sh

# Set .editorconfig globally
# Check if .editorconfig exist
if [ ! -e $HOME/.editorconfig ]; then
  echo "Creating a symbolic link for .editorconfig"
  ln -sf $DOTFILES_ROOT/.editorconfig $HOME/.editorconfig
fi
