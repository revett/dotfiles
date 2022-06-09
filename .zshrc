# .bashrc
#
# @author Charlie Revett

# Include brew packages and apps within path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Include Homebrew installed Go
# TODO: remove when updating to :latest
export PATH="/opt/homebrew/opt/go@1.17/bin:$PATH"

# https://grpc.io/docs/languages/go/quickstart/
export PATH="$PATH:$(go env GOPATH)/bin"

# Enable plugins
plugins=(git brew)

# Include installed Go packages within path
export PATH=$HOME/go/bin:$PATH

# Set default editor
export EDITOR='vim'

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
autoload -Uz compinit && compinit

# Tab completion fix capitalisation errors for directories and files
# https://superuser.com/questions/1092033
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Load autocomplete for PKM note bash script
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source /Users/revett/projects/github.com/revett/sepias/sepias-completion.bash
