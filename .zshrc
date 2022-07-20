# .bashrc
#
# @author Charlie Revett

# oh-my-zsh configuration taken from their template .zshrc file (start)
# See: https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode reminder # just remind me to update when it's time

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Disable themes
ZSH_THEME=""

# Enable plugins
plugins=(brew docker docker-compose git golang)

source $ZSH/oh-my-zsh.sh

# User configuration

# Include brew packages and apps within path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add user go binaries to PATH
export PATH=$PATH:~/go/bin

# Set default editor
export EDITOR='code -w'

# Configure prompt
# https://starship.rs/
eval "$(starship init zsh)"

# Setup fzf
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# Load other bash scripts
for file in ~/dotfiles/.{functions,aliases}; do
  [ -r "$file" ] && source "$file";
done;
unset file;

