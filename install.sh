#! /usr/bin/env bash
#
# Install script for repo
#
# @author Charlie Revett

# Bash
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bashrc ~/.bashrc

# Git
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore ~/.gitignore

# Starship
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml

# Vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc

# VSCode
ln -sf ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/
ln -sf ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/
