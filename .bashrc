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

# Load other bash scripts
for file in ~/dotfiles/.{functions,aliases}; do
	[ -r "$file" ] && source "$file";
done;
unset file;

