# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew bundler chruby common-aliases docker gem jsontools ruby sudo web-search zsh-syntax-highlighting)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/charlie/Dropbox/Projects/Code/golang/bin"

source $ZSH/oh-my-zsh.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

eval "$(docker-machine env dev)"

export BBC_COSMOS_TOOLS_CERT=~/.certs/dev.bbc.co.uk.pem

export GOPATH=/Users/charlie/Dropbox/Projects/Code/golang

DEV_ENV=$HOME/Dropbox/Projects/Code/Github/dev-env

PATH="$DEV_ENV:$PATH"
PATH="$DEV_ENV/scripts:$PATH"

source $DEV_ENV/alias

# Setup zsh-syntax-highlighting
source $DEV_ENV/dotfiles/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/plugin.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
