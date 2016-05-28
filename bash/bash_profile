#RVM
eval "$(rbenv init -)"
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Base16 Shell
if [ -d "$HOME/.dotfiles/vim/bundle/base16-shell" ]; then
  BASE16_SHELL="$HOME/.dotfiles/vim/bundle/base16-shell/base16-solarized.light.sh"
  [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
fi

# Bash git prompt
if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Custom
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

# Alias
alias rm="rm -irf"
alias c="clear"
alias be="bundle exec"
alias bi="bundle install"
alias f="be foreman start"
