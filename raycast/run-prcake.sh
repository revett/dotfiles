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

# Function to approve a GitHub PR with an optional message and a cake emoji.
# Usage:
#   prcake PR_NUMBER ["OPTIONAL_MESSAGE"] [REPO_NAME]
#   If REPO_NAME is not provided or is empty, defaults to "core".
#   If OPTIONAL_MESSAGE is provided, it is added above the cake emoji.
# TODO: Update this to be organisation generic, and not linked to incident-io.
prcake() {
  if [ $# -lt 1 ]; then
    echo "error: PR_NUMBER is required."
    return 1
  fi

  if ! [[ $1 =~ ^[0-9]+$ ]] || [ $1 -le 0 ]; then
    echo "error: first argument must be a positive integer."
    return 1
  fi

  if ! command -v gh &> /dev/null; then
    echo "error: gh command could not be found."
    return 1
  fi

  local message=${2:-""}
  local repo=${3:-core}
  local pr_url="https://github.com/incident-io/$repo/pull/$1"

  if [ -z "$message" ]; then
    gh pr review $pr_url --approve --body ":cake:"
  else
    gh pr review $pr_url --approve --body "$message

:cake:"
  fi
}

prcake "$1" "$2" "$3"
