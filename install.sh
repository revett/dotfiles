#! /usr/bin/env bash
#
# Install script for repo.
#
# @author Charlie Revett (@revcd).

echo "> starting install.sh"
echo "> creating symlinks"

# Shell.
ln -sf ~/projects/github.com/revett/dotfiles/.zshrc ~/.zshrc

# Git.
ln -sf ~/projects/github.com/revett/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/projects/github.com/revett/dotfiles/.gitignore ~/.gitignore

# Ghostty.
mkdir -p ~/.config/ghostty
ln -sf ~/projects/github.com/revett/dotfiles/ghostty ~/.config/ghostty/config

# Starship.
ln -sf ~/projects/github.com/revett/dotfiles/starship.toml ~/.config/starship.toml

# Vim.
ln -sf ~/projects/github.com/revett/dotfiles/.vimrc ~/.vimrc

# VS Code / Cursor.
ln -sf ~/projects/github.com/revett/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/
ln -sf ~/projects/github.com/revett/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/

# Golang CI Lint.
# https://golangci-lint.run/usage/configuration/
ln -sf ~/projects/github.com/revett/dotfiles/.golangci.yml ~/.golangci.yml

echo "> complete"
