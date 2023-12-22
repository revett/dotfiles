#! /usr/bin/env bash
#
# Install script for repo.
#
# @author Charlie Revett (@revcd).

echo "> starting install.sh"
echo "> setting machine name"

MACHINE_NAME_FILE=~/projects/github.com/revett/dotfiles/machine_name.txt

if [ ! -f "$MACHINE_NAME_FILE" ]; then
  echo "$MACHINE_NAME_FILE does not exist, skipping."
else
  MACHINE_NAME=$(cat $MACHINE_NAME_FILE)
  echo "> using \"$MACHINE_NAME\" as machine name"

  sudo scutil --set HostName $MACHINE_NAME
  sudo scutil --set LocalHostName $MACHINE_NAME
  sudo scutil --set ComputerName $MACHINE_NAME
  dscacheutil -flushcache
fi

echo "> creating symlinks"

# Shell.
ln -sf ~/projects/github.com/revett/dotfiles/.zshrc ~/.zshrc

# Git.
ln -sf ~/projects/github.com/revett/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/projects/github.com/revett/dotfiles/.gitignore ~/.gitignore

# Starship.
ln -sf ~/projects/github.com/revett/dotfiles/starship.toml ~/.config/starship.toml

# Vim.
ln -sf ~/projects/github.com/revett/dotfiles/.vimrc ~/.vimrc

# VSCode.
ln -sf ~/projects/github.com/revett/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/
ln -sf ~/projects/github.com/revett/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/

# Golang CI Lint.
# https://golangci-lint.run/usage/configuration/
ln -sf ~/projects/github.com/revett/dotfiles/.golangci.yml ~/.golangci.yml

echo "> complete"
