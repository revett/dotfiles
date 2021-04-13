#!/usr/bin/env bash

# Pull latest
git pull origin main

# Symlink files
for file in .{gitconfig,gitignore,vimrc,zshrc}; do
  [ -r "$file" ] && ln -sf ~/.dotfiles/$file ~
done;
unset file

# Karabiner
cp ~/.dotfiles/karabiner.json ~/.config/karabiner/

# MTMR
ln -sf ~/.dotfiles/mtmr.json ~/Library/Application\ Support/MTMR/items.json

# VSCode
ln -sf ~/.dotfiles/.vscode/keybindings.json ~/Library/Application\ Support/Code/User/
ln -sf ~/.dotfiles/.vscode/settings.json ~/Library/Application\ Support/Code/User/

source ~/.zshrc
