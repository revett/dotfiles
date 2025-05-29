#! /usr/bin/env bash
#
# Install script for repo
#
# @author Charlie Revett (@revcd)

echo "> starting install.sh"
echo "> creating symlinks"

# Shell
ln -sf ~/projects/github.com/revett/dotfiles/.zshrc ~/.zshrc

# Git
ln -sf ~/projects/github.com/revett/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/projects/github.com/revett/dotfiles/.gitignore ~/.gitignore

# Ghostty
mkdir -p ~/.config/ghostty
ln -sf ~/projects/github.com/revett/dotfiles/ghostty.toml ~/.config/ghostty/config

# Starship
ln -sf ~/projects/github.com/revett/dotfiles/starship.toml ~/.config/starship.toml

# Vim
ln -sf ~/projects/github.com/revett/dotfiles/.vimrc ~/.vimrc

# Cursor
ln -sf ~/projects/github.com/revett/dotfiles/cursor/keybindings.json ~/Library/Application\ Support/Cursor/User/
ln -sf ~/projects/github.com/revett/dotfiles/cursor/settings.json ~/Library/Application\ Support/Cursor/User/

# Golang CI Lint
# https://golangci-lint.run/usage/configuration/
ln -sf ~/projects/github.com/revett/dotfiles/.golangci.yml ~/.golangci.yml

echo "> complete"
