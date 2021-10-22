# Enable colors
# https://unix.stackexchange.com/questions/2897/clicolor-and-ls-colors-in-bash
export CLICOLOR=1

# Set default editor
export EDITOR='vim'

# Configure prompt
# https://starship.rs/
eval "$(starship init bash)"

# Aliases for changing directories
alias ~='cd $HOME'
alias dl='cd ~/Downloads'
alias p='cd ~/projects'
alias rev='cd ~/projects/github.com/revett'
alias vid='cd ~/projects/github.com/vidsy'

# Aliases for git
alias ggpull='git pull origin $(branch)'
alias ggpush='git push origin $(branch)'

# General purpose aliases
alias reload='source ~/.bash_profile'

# Git helpers
# https://gist.github.com/DavidToca/3086571
branch () {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

# Set BSD ls to use coreutils gls
# https://github.com/sharkdp/vivid#on-macos
alias ls="gls --color"
