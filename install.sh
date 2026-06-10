#! /usr/bin/env bash
set -euo pipefail

# Install script for repo
#
# @author Charlie Revett

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

# Cursor

ln -sf ~/projects/github.com/revett/dotfiles/cursor/keybindings.json ~/Library/Application\ Support/Cursor/User/
ln -sf ~/projects/github.com/revett/dotfiles/cursor/settings.json ~/Library/Application\ Support/Cursor/User/

# CMUX

mkdir -p ~/.config/cmux
ln -sf ~/projects/github.com/revett/dotfiles/cmux/config.json ~/.config/cmux/cmux.json

# Claude

CLAUDE_SRC=~/projects/github.com/revett/dotfiles/claude

# Remove stale symlinks pointing into the dotfiles claude dir so deletions in
# the source propagate cleanly on re-install
find ~/.claude -type l -lname "$CLAUDE_SRC/*" -delete 2>/dev/null || true

# Prune empty directories left behind when files are deleted or renamed in the
# source (e.g. removed skills), scoped to mirror-managed subtrees so app-owned
# state elsewhere in ~/.claude is untouched
for dir in "$CLAUDE_SRC"/*/; do
  find "$HOME/.claude/$(basename "$dir")" -mindepth 1 -type d -empty -delete 2>/dev/null || true
done

# Mirror claude/ into ~/.claude/
find "$CLAUDE_SRC" -type f | while read -r src; do
  rel="${src#$CLAUDE_SRC/}"
  dest="$HOME/.claude/$rel"
  mkdir -p "$(dirname "$dest")"
  ln -sf "$src" "$dest"
done

# Agent Safehouse

# The scratchpad directory is a non-git tracked directory for agents (e.g. Claude) to use as a
# playground.
mkdir -p ~/projects/scratchpad
mkdir -p ~/.config/agent-safehouse
ln -sf ~/projects/github.com/revett/dotfiles/agent-safehouse-overrides.sb ~/.config/agent-safehouse/local-overrides.sb

echo "> complete"
