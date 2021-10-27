# .bashrc
#
# @author Charlie Revett

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

# Load other bash scripts
for file in ~/dotfiles/.{functions,aliases}; do
  [ -r "$file" ] && source "$file";
done;
unset file;

# Setup fzf
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi
source "/usr/local/opt/fzf/shell/key-bindings.bash"
