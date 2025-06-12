# .bashrc
#
# @author Charlie Revett (@revcd)

# oh-my-zsh configuration taken from their template .zshrc file (start)
# See: https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template

# ---
# Personal
# ---

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode reminder # Just remind me to update when it's time

# Uncomment the following line to enable command auto-correction
ENABLE_CORRECTION="true"

# Disable themes
ZSH_THEME=""

# Enable plugins
plugins=(brew git golang)

# Set up oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Set where hops.yml is located
# https://github.com/revett/hops
export HOPS_CONFIG="$HOME/projects/github.com/revett/dotfiles/hops.yml"

# Disable autocorrect in Zsh
# https://coderwall.com/p/jaoypq/disabling-autocorrect-in-zsh
unsetopt correct_all

# Include brew packages and apps within path (Apple Silicon only)
if [[ $(uname -m) == 'arm64' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Add user go binaries to PATH
export PATH=$PATH:~/go/bin

# Add Java to path, needed for OpenAPI generation
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Set default editor
export EDITOR='cursor -w'

# Add aviator-co/av tab completion
source <(av completion zsh)

# Configure Starship prompt
# https://starship.rs
eval "$(starship init zsh)"

# Setup fzf (Apple Silicon only)
if [[ $(uname -m) == 'arm64' ]]; then
  # Setup fzf
  if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
    export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
  fi
  source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
fi

# Setup fzf (Intel only)
if [[ $(uname -m) == 'x86_64' ]]; then
  # Include brew packages and apps within path
  if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
    export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
  fi
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"
fi

# Set up autoenv
# https://github.com/hyperupcall/autoenv
source $(brew --prefix autoenv)/activate.sh

# Set fnm environment variables
# https://github.com/Schniz/fnm#shell-setup
eval "$(fnm env --corepack-enabled --use-on-cd --resolve-engines --shell zsh)"

# Default to a specific version of Node
fnm use 22

# Load rust environment if installed
if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

# Check if `hops apply` needs to be run
hops reminder

# ---
# Work
# ---

# Add libpq to PATH if it is installed, a requirement of team-plain/services
if [ -d "/opt/homebrew/opt/libpq/bin" ]; then
  export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

  # 12GB for TS compilation in team-plain/services
  export NODE_OPTIONS="--max-old-space-size=12288"

  # Make TS compilation faster by using efficient file watching
  export TSC_NONPOLLING_WATCHER=true
  export TSC_WATCHFILE=UseFsEvents
fi

# Source aliases and functions within team-plain/toolbox, and set default AWS profile
if [[ -d "/Users/revett/projects/github.com/team-plain/toolbox" ]]; then
  source "/Users/revett/projects/github.com/team-plain/toolbox/index.sh"
  aws-set-profile dev-charlie-admin
fi

# Disable corepack automatically pinning by adding `packageManager` to `package.json`
export COREPACK_ENABLE_AUTO_PIN=0

# Setup pnpm global binaries
if [ -d "$HOME/Library/pnpm" ]; then
  export PNPM_HOME="$HOME/Library/pnpm"
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
fi

# Default internal CLI format to JSON
export PLAIN_CLI_FORMAT="json"

# ---
# Load other bash scripts
# ---

for file in ~/projects/github.com/revett/dotfiles/.{functions,aliases}; do
  [ -r "$file" ] && source "$file";
done;
unset file;
