#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Generate GitHub PR markdown (prgen-markdown)
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🧰
# @raycast.argument1 { "type": "text", "placeholder": "-r|--reviews-channel", "optional": true }

# Documentation:
# @raycast.description Generates GitHub pull request markdown for Slack.
# @raycast.author Charlie Revett (@revcd)
# @raycast.authorURL https://revcd.com

# `prgen-markdown` creates a markdown string from details about a GitHub pull request.
# Flags:
#   -s|--silent: Silence output.
#   -r|--reviews-channel: Open the #reviews channel.
prgen-markdown() {
  # Links to Slack channels.
  local team_reviews_channel="slack://channel?team=T01DMDZT3PD&id=C05FKBZMTK9"
  local reviews_channel="slack://channel?team=T01DMDZT3PD&id=C02D0H4J65U"

  # Flags.
  local silent_flag=0
  local reviews_channel_flag=0

  # Check for flags.
  for arg in "$@"; do
    case $arg in
      -s|--silent) # Silence output.
        silent_flag=1
        ;;
      -r|--reviews-channel) # Open the #reviews channel.
        reviews_channel_flag=1
        ;;
    esac
  done

  # Get data from the GitHub API, via the CLI.
  local data=$(gh pr view --json title,url,additions,deletions)
  local additions=$(jq -r '.additions' <<< "$data")
  local deletions=$(jq -r '.deletions' <<< "$data")

  local lines_changed=$(echo "$additions + $deletions" | bc)
  if [ $silent_flag -eq 0 ]; then
    echo "Changes: $lines_changed"
  fi

  # Conditionally choose an emoji based on the number of lines changed.
  local emoji=""
  if [ "$lines_changed" -le 10 ]; then
    emoji=":tardigrade:"
  elif [ "$lines_changed" -le 100 ]; then
    emoji=":bat:"
  elif [ "$lines_changed" -le 250 ]; then
    emoji=":wolf:"
  else
    emoji=":gorilla:"
  fi

  local link="$emoji $(jq -r '"[\(.title)](\(.url))"' <<< "$data" | tr -d '\n') cc/ "

  # Copy to clipboard, and output.
  echo -n "$link" | pbcopy
  if [ $silent_flag -eq 0 ]; then
    echo "Output:  $link"
  fi

  # Decide which Slack channel to open.
  local slack_channel=$([ $reviews_channel_flag -eq 1 ] && echo "$reviews_channel" || echo "$team_reviews_channel")
  open "$slack_channel"

  echo "Copied to clipboard, opening Slack"
}

# Run the `prgen-markdown` function.
cd /Users/revett/projects/github.com/incident-io/core && prgen-markdown $1
