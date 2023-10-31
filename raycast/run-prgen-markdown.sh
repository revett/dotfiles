#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Generate GitHub PR markdown (prgen-markdown)
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "-r|--reviews-channel", "optional": true }

# Documentation:
# @raycast.description Generates GitHub pull request markdown for Slack.
# @raycast.author Charlie Revett (@revcd)
# @raycast.authorURL https://revcd.com

source /Users/revett/projects/github.com/revett/dotfiles/.functions
cd /Users/revett/projects/github.com/incident-io/core && prgen-markdown $1
echo "🔗 Copied to clipboard"
