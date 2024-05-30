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

# `prcreate` creates a GitHub pull request using the current branch name.
prcreate(){
  if ! command -v gh &> /dev/null; then
    echo "error: gh command could not be found."
    return 1
  fi

  branch_name=$(branch)

  # Define regex pattern for branch format "revett/<string>-<number>-<title>".
  pattern="revett/(.*)-(.*)-(.*)"

  # Check if branch name matches the pattern.
  if [[ $branch_name =~ $pattern ]]; then
    # Extract parts from the branch name using cut commands.
    string=$(echo $branch_name | cut -d '/' -f 2 | cut -d '-' -f 1 | tr '[:lower:]' '[:upper:]')
    number=$(echo $branch_name | cut -d '-' -f 2)
    title=$(echo $branch_name | cut -d '-' -f 3- | tr '-' ' ')

    # Capitalize first character of the title.
    title=$(echo "$title" | sed -e "s/\(.\)/\u\1/")

    # Format the title as per requirement
    formatted_title="${string}-${number} ${title}"
  else
    formatted_title=$branch_name
  fi

  # Use the GitHub CLI to create the pull request.
  gh pr create --web --title "$formatted_title" --body "- ..."
}

# Source the functions file, as we need the `branch` function.
source /Users/revett/projects/github.com/revett/dotfiles/.functions

# Run the `prcreate` function.
cd /Users/revett/projects/github.com/incident-io/core && prcreate
