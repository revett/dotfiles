#!/bin/bash
# Derives notification title from PEON_CWD and PEON_HOOK_EVENT.
# Example output: "revett.dotfiles - Permission Request"

OWNER=$(basename "$(dirname "$PEON_CWD")")
REPO=$(basename "$PEON_CWD")
# Remap event names
case "$PEON_HOOK_EVENT" in
  Stop)              EVENT="Done" ;;
  SessionStart)      EVENT="Start" ;;
  SessionEnd)        EVENT="End" ;;
  PermissionRequest) EVENT="Permission" ;;
  *)                 EVENT=$(echo "$PEON_HOOK_EVENT" | sed 's/\([a-z]\)\([A-Z]\)/\1 \2/g') ;;
esac
echo "${OWNER}.${REPO} - ${EVENT}"
