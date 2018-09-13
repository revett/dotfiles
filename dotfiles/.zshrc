# ---
# ZSH
# ---

export ZSH=/Users/revchar/.oh-my-zsh
ZSH_THEME="robbyrussell"
HIST_STAMPS="dd/mm/yyyy"
export HISTCONTROL=ignorespace
plugins=(git brew docker)
source $ZSH/oh-my-zsh.sh

# ---
# HOMEBREW
# ---

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_NO_INSECURE_REDIRECT=1

# ---
# ALIASES
# ---

export DEV_ENV="/Users/revchar/code/other/github.com/revett/dev-env"
source $DEV_ENV/alias

# ---
# GO
# ---

export GOPATH="/Users/revchar/code/go"

# ---
# PATH
# ---

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:$DEV_ENV"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/Users/revchar/homebrew/bin"
export PATH="$PATH:/Users/revchar/homebrew/opt/go/libexec/bin"
export PATH="$PATH:/Users/revchar/code/other/github.com/vidsy/infrastructure/scripts"

# ---
# SSH
# ---

eval `keychain --eval github_vidsy_mbp`

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
