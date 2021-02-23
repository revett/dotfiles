# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# ZSH
export ZSH="/Users/revett/.oh-my-zsh"
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git)
ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

# Default editor
export EDITOR='vim'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Load dotfiles
for file in ~/.dotfiles/.{aliases,functions}; do
	[ -r "$file" ] && source "$file";
done;
unset file;
