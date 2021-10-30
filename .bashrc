# .bashrc
#
# @author Charlie Revett

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
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi
source "/usr/local/opt/fzf/shell/key-bindings.bash"

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

# Enable changing directories without using cd
# https://unix.stackexchange.com/a/4270
shopt -s autocd

# Load other bash scripts
for file in ~/dotfiles/.{functions,aliases}; do
  [ -r "$file" ] && source "$file";
done;
unset file;
