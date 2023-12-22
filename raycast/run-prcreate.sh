#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Creates a new GitHub pull request (prcreate)
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🧰

# Documentation:
# @raycast.description Creates a new GitHub pull request.
# @raycast.author Charlie Revett (@revcd)
# @raycast.authorURL https://revcd.com

source /Users/revett/projects/github.com/revett/dotfiles/.functions
cd /Users/revett/projects/github.com/incident-io/core && prcreate
