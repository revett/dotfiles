#!/bin/bash
# Derives notification title from PEON_CWD and PEON_HOOK_EVENT.
# Example output: "revett.dotfiles - Permission Request"

OWNER=$(basename "$(dirname "$PEON_CWD")")
REPO=$(basename "$PEON_CWD")
EVENT=$(echo "$PEON_HOOK_EVENT" | sed 's/\([a-z]\)\([A-Z]\)/\1 \2/g')
echo "${OWNER}.${REPO} - ${EVENT}"
