# .bashrc
#
# @author Charlie Revett

# Silence warning about use of bash over zsh
# https://support.apple.com/en-gb/HT208050
# TODO: switch to using zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

# Include brew packages and apps within path
eval "$(/opt/homebrew/bin/brew shellenv)"

# Include installed Go packages within path
export PATH=$HOME/go/bin:$PATH

# Enable colors
# https://unix.stackexchange.com/questions/2897/clicolor-and-ls-colors-in-bash
export CLICOLOR=1

# Set default editor
export EDITOR='vim'

# Configure prompt
# https://starship.rs/
eval "$(starship init bash)"

# Enable bash autocomplete
# https://sourabhbajaj.com/mac-setup/BashCompletion/
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Configure bash autocomplete to be more responsive
# https://superuser.com/questions/288714
# https://unix.stackexchange.com/questions/261687
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'TAB:menu-complete'

# Setup fzf
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi
source "/opt/homebrew/opt/fzf/shell/key-bindings.bash"

# Configure bash history
# https://blog.sanctum.geek.nz/better-bash-history/
# https://unix.stackexchange.com/a/1292
HISTFILESIZE=10000
HISTSIZE=10000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='%F %T '
shopt -s histappend
if [[ $PROMPT_COMMAND != "history"* ]]; then
  PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
fi

# Load other bash scripts
for file in ~/dotfiles/.{functions,aliases}; do
  [ -r "$file" ] && source "$file";
done;
unset file;

# Load autocomplete for PKM note bash script
source /Users/revett/projects/github.com/revett/sepias/sepias-completion.bash
