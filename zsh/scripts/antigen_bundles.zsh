#!/bin/zsh

antigen use oh-my-zsh
antigen bundle git
antigen theme agnoster

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply
