#!/usr/bin/env bash

# Claude Code Stop hook. Updates cmux sidebar status and plays a sound.

cmux set-status claude 'Claude → Done!' --icon checkmark.circle --color "#05df72"
afplay "$HOME/.claude/hooks/peon-work-work.mp3" &
