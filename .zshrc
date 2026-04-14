# .zshrc
#
# @author Charlie Revett

# oh-my-zsh configuration taken from their template .zshrc file (start)
# See: https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template

# ---
# Shared
# ---

# Shared path to dotfiles repo
export DOTFILES_PATH="$HOME/projects/github.com/revett/dotfiles"

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode reminder # Just remind me to update when it's time

# Disable themes
ZSH_THEME=""

# Set up oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Set where hops.yml is located
# https://github.com/revett/hops
export HOPS_CONFIG="$DOTFILES_PATH/hops.yml"

# Include brew packages and apps within path (Apple Silicon only)
if [[ $(uname -m) == 'arm64' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set default editor
export EDITOR='cursor -w'

# Configure Starship prompt
# https://starship.rs
eval "$(starship init zsh)"

# Setup fzf (keybindings and fuzzy completion)
eval "$(fzf --zsh)"

# Set up direnv
# https://direnv.net/docs/hook.html
eval "$(direnv hook zsh)"

# Set fnm environment variables
# https://github.com/Schniz/fnm#shell-setup
eval "$(fnm env --corepack-enabled --use-on-cd --resolve-engines --shell zsh)"

# Default to a specific version of Node
fnm use 24

# Check if `hops apply` needs to be run
hops reminder

# Configure Agent Safehouse, see .functions for bash functions related to safehouse()
SAFEHOUSE_APPEND_PROFILE="$HOME/.config/agent-safehouse/local-overrides.sb"

# ---
# Check MACHINE_TYPE.txt and set environment variable accordingly
# ---

MACHINE_TYPE_FILE="$DOTFILES_PATH/MACHINE_TYPE.txt"
if [ ! -f "$MACHINE_TYPE_FILE" ]; then
  echo "error: MACHINE_TYPE.txt not found at $MACHINE_TYPE_FILE" >&2
  return 1
fi

DOTFILES_MACHINE_TYPE="$(cat "$MACHINE_TYPE_FILE" | tr -d '[:space:]')"
if [[ "$DOTFILES_MACHINE_TYPE" != "PERSONAL" && "$DOTFILES_MACHINE_TYPE" != "WORK" ]]; then
  echo "error: MACHINE_TYPE.txt must contain 'PERSONAL' / 'WORK', got '$DOTFILES_MACHINE_TYPE'" >&2
  return 1
fi
export DOTFILES_MACHINE_TYPE

# ---
# Personal
# ---

if [[ "$DOTFILES_MACHINE_TYPE" == "PERSONAL" ]]; then
  # Add user go binaries to PATH
  export PATH=$PATH:~/go/bin
fi

# ---
# Work
# ---

if [[ "$DOTFILES_MACHINE_TYPE" == "WORK" ]]; then
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
  if [[ -d "$HOME/projects/github.com/team-plain/toolbox" ]]; then
    source "$HOME/projects/github.com/team-plain/toolbox/index.sh"
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
fi

# ---
# CMUX
# ---

# Only configure cmux if running inside a cmux session (CMUX_WORKSPACE_ID is set by cmux)
if [[ -n "$CMUX_WORKSPACE_ID" ]]; then
  # Auto rename the workspace based on the current directory. When inside a project directory,
  # extracts the owner/repo slug from the path, e.g. ~/projects/github.com/team-plain/services
  # resolves to "team-plain/services". Falls back to "👨‍🌾 Workspace" outside of projects.
  _cmux_chpwd_rename() {
    local projects_base="$HOME/projects/github.com/"
    if [[ "$PWD" == ${projects_base}* ]]; then
      local rel="${PWD#$projects_base}"
      if [[ "$rel" == */* ]]; then
        local owner="${rel%%/*}"
        local rest="${rel#*/}"
        local repo="${rest%%/*}"
        cmux rename-workspace "$owner/$repo" > /dev/null
        return
      fi
    fi
    cmux rename-workspace "👨‍🌾 Workspace" > /dev/null
  }

  # Register as a zsh chpwd hook, and run once for the initial working directory
  chpwd_functions+=(_cmux_chpwd_rename)
  _cmux_chpwd_rename
fi

# ---
# Load Bash Scripts
# ---

for file in $DOTFILES_PATH/.{functions,aliases}; do
  [ -r "$file" ] && source "$file";
done;
unset file;
