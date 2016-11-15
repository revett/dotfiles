export ZSH=/Users/revett/.oh-my-zsh

ZSH_THEME="robbyrussell"

HIST_STAMPS="dd/mm/yyyy"

plugins=(git brew bundler chruby docker gem)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export GOPATH="/Users/revett/projects/code/golang"
export PATH=$PATH:/usr/local/go/bin

export HOMEBREW_NO_ANALYTICS=1

source $ZSH/oh-my-zsh.sh

DEV_ENV=$HOME/projects/code/github.com/revett/dev-env

PATH="$DEV_ENV:$PATH"
PATH="/Users/revett/projects/vidsy/infrastructure/scripts:$PATH"
PATH="$GOPATH/bin:$PATH"
PATH="/Users/revett/.npm-packages/bin:$PATH"

source $DEV_ENV/alias

source /usr/local/share/chruby/chruby.sh

eval `keychain --eval github_vidsy_mbp`

export NVM_DIR="/Users/revett/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

nvm use

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
