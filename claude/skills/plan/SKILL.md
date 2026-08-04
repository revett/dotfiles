---
name: plan
description: Investigate a problem and create a plan as a HTML document
---

# Instructions

- Exhaustively investigate the given subject
- Think deeply about the problem space and domain
- Come up with a plan as to how to solve it
- Output a single local HTML page to explain your investigation, thinking, plan, and recommendations
- Charlie should provide the subject of the plan (e.g. Linear ticket), if not then fail fast
- Assume the reader is coming to the document with low context
- Start the document at a simpler high level, then adding depth and complexity as it continues
- The document should serve as a surface for discussion and decision making

## Critical

- Do not be agreeable, strong opinions are welcome
- Use subagents if relevant to be more effective in your task
- If creating a local artifact, ensure to save it to the [scratchpad](~/projects/scratchpad)
- Feel free to update and use an existing artifact if that makes sense
- If helpful to your task, ask Charlie to fetch data/context manually for you, where you lack access
- Keep Charlie updated on your progress as you complete the task
- Always use a light theme when creating HTML artifacts
- After creating/updating a local HTML artifact, ensure to always open it within cmux (see below)
- Use available tools (where appropriate) to help build context and a better understanding
- If applicable, include a sticky ToC sidebar, left of the main content that scrolls with the page

### Opening in Browser

Open with `new-surface`, never `cmux open`. Follow the following process for opening correctly:

```bash
abs="/absolute/path/to/artifact.html" # the file you just created or updated

command -v cmux >/dev/null 2>&1 && [ -n "$CMUX_WORKSPACE_ID" ] || exit 0

# Target pane = the one not running this session. Never hardcode, refs shift per session.
target=""
for p in $(cmux list-panes --workspace "$CMUX_WORKSPACE_ID" | grep -o 'pane:[0-9]*'); do
  cmux list-pane-surfaces --workspace "$CMUX_WORKSPACE_ID" --pane "$p" --id-format both 2>/dev/null \
    | grep -qi "$CMUX_SURFACE_ID" || { target="$p"; break; }
done

cmux new-surface --type browser --pane "$target" --url "file://$abs" \
  --focus false --workspace "$CMUX_WORKSPACE_ID"
# → OK surface:209 pane:2 workspace:2   (trust this line, not the exit code)
```

- Empty `$target` means one pane; use `cmux new-pane --type browser --direction left --url <url>`
- `file://` needs an absolute path
- Close only what you opened: `cmux close-surface --surface <ref>`
- `surface:2` and `pane:2` are unrelated sequences
