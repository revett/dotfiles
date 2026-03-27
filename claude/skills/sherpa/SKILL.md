---
name: sherpa
description: Open the diffity diff viewer, fix comments, or explain local changes
user-invocable: true
---

# Sherpa

GitHub style diff viewer for local changes. Three modes based on arguments:

- `/sherpa` → Open viewer for all local changes (staged + unstaged)
- `/sherpa fix` → Read open comments and make the fixes
- `/sherpa explain` → Guided walkthrough of local changes

Speed is critical. Minimise tool calls, parallelise where possible, and avoid unnecessary steps.

## Prerequisites

Run `which diffity` to ensure CLI is installed, tell the user if not found.

## Open Viewer (Default)

1. Run `diffity` with `run_in_background: true`
1. Wait 2 seconds, run `diffity list --json` to get the port
1. Tell the user the URL

## Fix

Run `diffity agent list --status open --json`. If no open threads, tell the user and stop.

For each open thread, skip general comments (filePath `__general__`) and threads where the last
comment is an agent question awaiting user response. Comments phrased as questions (e.g. "should we
add X?") are requests, not questions; make the change.

Read all source files for open threads in parallel. Make all fixes, then resolve all threads. Do not
alternate between reading, editing, and resolving one at a time.

Mark done with:

```bash
diffity agent resolve <id> --summary "Fixed: <description>"
```

Tell the user to check the browser when all threads are resolved.

## Explain

Build a guided, narrated walkthrough of all local changes. Order steps by logical flow (how the
changes connect), not by file or alphabetical order.

Tours require a tree session (not a diff session). Run `diffity list --json` to check. If no tree
session is running (ref `__tree__`), start one with `diffity tree --no-open --new` using
`run_in_background: true`, wait 2 seconds. Get the diff with `git diff` and `git diff --cached` in
parallel. Read all changed files in parallel.

Start the tour with:

```bash
diffity agent tour-start --topic "<3-6 word title>" --body "<overview>" --json`
```

The body is step 0, shown before any code. Write a concise overview: what the changes accomplish,
why they were made, which files are involved, and how they connect.

Add steps in logical order with:

```bash
diffity agent tour-step --tour <id> --file <path> --line <start> --end-line <end> --body "<explanation>" --annotation "<3-6 word label>" --json`
```

For each step, cover both what changed and why. Infer the motivation from the surrounding code,
commit context, and the shape of the diff. If the reason is ambiguous, say so rather than guessing.

Flag high risk changes with a ⚠️ prefix in the annotation. Use your judgement based on the context
of the codebase and the nature of the change to determine what qualifies as high risk.

Use goto links for cross references (`` [`name`](goto:path/to/file.ts:line) ``) and focus links for
large ranges (`[label](focus:startLine-endLine)`).

Finish with:

```bash
diffity agent tour-done --tour <id> --json
```

Open in browser with:

```bash
open "http://localhost:<port>/tour/<tour-id>"
```
