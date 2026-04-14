#!/usr/bin/env bash

# Claude Code Stop hook. Updates cmux sidebar status, sends a cmux notification, and plays a sound.

INPUT=$(cat)

CWD=$(echo "$INPUT" | jq -r '.cwd // ""')
PROJECTS_BASE="$HOME/projects/github.com/"

if [[ "$CWD" == ${PROJECTS_BASE}* ]]; then
  REL="${CWD#$PROJECTS_BASE}"
  if [[ "$REL" == */* ]]; then
    OWNER="${REL%%/*}"
    REST="${REL#*/}"
    REPO="$OWNER/${REST%%/*}"
  else
    REPO="👨‍🌾 Workspace"
  fi
else
  REPO="👨‍🌾 Workspace"
fi

cmux set-status claude 'Claude → Done!' --icon checkmark.circle --color "#05df72"
afplay "$HOME/.claude/hooks/peon-work-work.mp3" &
osascript -e "display notification \"Done\" with title \"$REPO\""
