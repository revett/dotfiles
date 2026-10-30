---
name: spawn
description: Hand work to a new agent in its own worktree space
---

# Instructions

Charlie wants work handed to a new Claude session that runs in parallel, in a fresh worktree of the
current repository, as its own space in Herdr.

1. Pick a short name for the work, one to three words (e.g. `api`, `backfill`); the space is named
   `<this space>-<name>` (e.g. `gaps-api`)
2. Write a self contained prompt to `~/projects/scratchpad/YYYY-MM-DD-HHMM_spawn-<name>.md`; the new
   agent has none of this conversation, so include the goal, the relevant part of the plan, file
   paths, decisions already made, and what done looks like
3. Start the prompt with `/do ` so it runs with the usual logistics, unless Charlie says otherwise
4. Run `~/projects/github.com/revett/koba/scripts/herdr-spawn <name> <prompt-file>`
5. Tell Charlie the space's name, then carry on with the conversation

For several independent pieces of work, spawn one space per piece.

If you are working off a local HTML document/plan, then take this moment to update it, especially if
it is tracking chunks of work.

If within the local HTML document/plan the work being spawned has a numerical ID, then use that
within the new space name, e.g. `gaps-1-api-auth`.
