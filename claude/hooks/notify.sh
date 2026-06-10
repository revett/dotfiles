#!/usr/bin/env bash

# Claude Code Stop hook. Updates cmux sidebar status and plays a sound.
command -v cmux >/dev/null 2>&1 && [ -n "$CMUX_WORKSPACE_ID" ] || exit 0
cmux set-status claude 'Done' --icon checkmark.circle --color "#05df72" || true
cmux notify --title "Claude" --body "Finished" --workspace "$CMUX_WORKSPACE_ID" || true
