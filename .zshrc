# .bashrc
#
# @author Charlie Revett

# Include brew packages and apps within path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Enable plugins
plugins=(git brew)

# Set default editor
export EDITOR='vim'

# Bind Ctrl+A and Ctrl+E to emacs keybindings
# https://stackoverflow.com/questions/23128353/zsh-shortcut-ctrl-a-not-working
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

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

# Completions
# https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
autoload -Uz compinit && compinit

# Tab completion fix capitalisation errors for directories and files
# https://superuser.com/questions/1092033
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
