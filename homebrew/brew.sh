#!/bin/bash

if [ "$(uname -s)" ==  "Darwin" ]; then
  # Is homebrew installed?
  if [ ! "$(which brew)" ]; then
    echo "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # Install brew bundle
  brew tap Homebrew/bundle

  # Install bre packages if it doesn't exist
  echo "Installing Homebrew bundles..."
  brew bundle
fi
