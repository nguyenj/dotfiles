# basics
alias ez="vim $HOME/.zshrc"
alias sz="source $HOME/.zshrc"

# git
alias gf="git fetch origin"
alias gs="git status"
alias gc="git clone $1 $2"
alias gca="git commit --amend"
alias gci="git commit"
alias gco="git checkout $1 $2"
alias grh="git reset --hard $1"
alias gsha="git rev-parse HEAD | tr -d '\n' | pbcopy && git rev-parse HEAD"

# NPM
alias ni="npm install"
alias nis="npm install --save"
alias nid="npm install --save-dev"
alias nig="npm install --global"
alias nr="npm run $1"
alias ns="npm run start"
alias nt="npm run test"

# Foreman
alias f='bundle exec foreman start'
