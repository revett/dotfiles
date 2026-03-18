#!/usr/bin/env bash

# Claude Code hook notification script.
# Shows a macOS notification when Claude has finished.

INPUT=$(cat)

CWD=$(echo "$INPUT" | jq -r '.cwd // ""')
REPO=$(cd "$CWD" && git remote get-url origin 2>/dev/null | sed 's|.*github\.com[:/]||; s|\.git$||' || basename "$CWD")

afplay "$HOME/.claude/hooks/peon-work-work.mp3" &
osascript -e "display notification \"Done\" with title \"$REPO\""
