# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/revett/.oh-my-zsh"

# ZSH Theme
ZSH_THEME="robbyrussell"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# ZSH Plugins
plugins=(git)

# https://github.com/ohmyzsh/ohmyzsh/issues/6835#issuecomment-390216875
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# ---
# User configuration
# ---

# Default editor
export EDITOR='vim'

# ---
# Aliases / Functions
# ---

# Colours for output
BLUE='\033[1;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Searching for files
qfind () { /usr/bin/find . -name "$@"'*' 2>&1 | grep -v "Operation not permitted" ; }

# Networking
alias myip='curl ifconfig.co'

# Process management
alias cpu-hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

# Docker developer environments
node-dev-env () {
  local CONTAINER_NAME="node-docker"
  if git rev-parse --git-dir > /dev/null 2>&1; then
    local REPO_NAME=$(basename `git rev-parse --show-toplevel`)
    local CONTAINER_NAME="node-docker_$REPO_NAME"
  fi

  if [ $# -eq 0 ]; then
    echo -e "${BLUE}info${NC}: no port argument passed."
    echo -e "${BLUE}info${NC}: starting Node development environment..."
    docker run --rm -it --name $CONTAINER_NAME -v $PWD:/src revett-local-node:latest
    return 0
  fi

  if ! [ ${#1} -eq 4 ]; then
    echo -e "${RED}error${NC}: port argument must be 4 characters" >&2
    return 1
  fi

  local CONTAINER_PORT=$1

  re='^[0-9]+$'
  if ! [[ $CONTAINER_PORT =~ $re ]] ; then
    echo -e "${RED}error${NC}: port argument is not a number" >&2
    return 1
  fi

  echo -e "${BLUE}info${NC}: mapping container port :$CONTAINER_PORT -> :8080"
  echo -e "${BLUE}info${NC}: starting Node development environment..."
  docker run --rm -it --name $CONTAINER_NAME -v $PWD:/src -p 8080:$CONTAINER_PORT revett-local-node:latest
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
