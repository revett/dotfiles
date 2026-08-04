---
name: handoff
description: Compact the current conversation into a handoff document for another agent to pick up
---

# Instructions

- Summarise the current conversation so a fresh agent can continue the work
- Don't duplicate content already captured in other artifacts, reference them by path or URL instead
- Redact any sensitive information, such as API keys, passwords, or PII
- Output the handoff as a local Markdown file

## Critical

- Do not be agreeable, strong opinions are welcome
- Use subagents if relevant to be more effective in your task
- If creating a local artifact, ensure to save it to the [scratchpad](~/projects/scratchpad)
- Feel free to update and use an existing artifact if that makes sense
- If helpful to your task, ask Charlie to fetch data/context manually for you, where you lack access
- Keep Charlie updated on your progress as you complete the task
- Always use a light theme when creating HTML artifacts
- After creating/updating a local artifact, ensure to always open it within cmux (see below)
- Use available tools (where appropriate) to help build context and a better understanding

### Opening in Browser

Open with `new-surface`, never `cmux open`. Follow the following process for opening correctly:

```bash
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
