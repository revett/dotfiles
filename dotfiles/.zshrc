# ---
# ZSH
# ---

export ZSH=/Users/revett/.oh-my-zsh
ZSH_THEME="robbyrussell"
HIST_STAMPS="dd/mm/yyyy"
plugins=(git brew bundler chruby docker gem)
source $ZSH/oh-my-zsh.sh

# ---
# HOMEBREW
# ---

export HOMEBREW_NO_ANALYTICS=1

# ---
# GOLANG
# ---

export GOPATH="/Users/revett/projects/code/golang"

# ---
# PATH
# ---

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export PATH="$PATH:$DEV_ENV"
export PATH="$PATH:/Users/revett/projects/vidsy/infrastructure/scripts"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/Users/revett/.npm-packages/bin"

# ---
# ALIASES
# ---

export DEV_ENV="$HOME/projects/code/github.com/revett/dev-env"
source $DEV_ENV/alias

# ---
# CHRUBY
# ---

source /usr/local/share/chruby/chruby.sh

# ---
# GITHUB SSH
# ---

eval `keychain --eval github_vidsy_mbp`

# ---
# NVM
# ---

export NVM_DIR="/Users/revett/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# ---
# ZSH AUTOCOMPLETE?
# ---

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
