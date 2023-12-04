#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Approve PR with :cake: (prcake)
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🍰
# @raycast.argument1 { "type": "text", "placeholder": "PR Number", "required": true }
# @raycast.argument2 { "type": "text", "placeholder": "Message (optional)", "optional": true }
# @raycast.argument3 { "type": "text", "placeholder": "Repo (default: core)", "optional": true }

# Documentation:
# @raycast.description Use this command to approve a PR with a :cake: emoji.
# @raycast.author Charlie Revett (@revcd)
# @raycast.authorURL https://revcd.com

source /Users/revett/projects/github.com/revett/dotfiles/.functions
prcake "$1" "$2" "$3"
echo "Approved PR #$1"
