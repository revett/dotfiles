# ---
# ZSH
# ---

export ZSH=/Users/revett/.oh-my-zsh
ZSH_THEME="robbyrussell"
HIST_STAMPS="dd/mm/yyyy"
export HISTCONTROL=ignorespace
plugins=(git brew bundler chruby docker gem)
source $ZSH/oh-my-zsh.sh

# ---
# HOMEBREW
# ---

export HOMEBREW_NO_ANALYTICS=1

# ---
# ALIASES
# ---

export DEV_ENV="$HOME/projects/code/github.com/revett/dev-env"
source $DEV_ENV/alias

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
# CHRUBY
# ---

source /usr/local/share/chruby/chruby.sh

# ---
# GITHUB SSH
# ---

eval `keychain --eval github_vidsy_mbp`

# ---
# ZSH AUTOCOMPLETE?
# ---

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ---
# OPEN VSCODE
# ---

function vscode {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}
