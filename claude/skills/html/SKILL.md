---
name: html
description: Create a single self-contained HTML artifact instead of a long markdown reply
---

# Instructions

- Create one self-contained local light theme HTML page that explains, compares, demonstrates, or
  lets the reader manipulate the subject more effectively than a wall of markdown would
- Reach for this whenever spatial layout, hierarchy, side-by-side comparison, a diagram, lightweight
  interaction, or a copy/export button would materially help
- Common shapes: an explainer or walkthrough, an approach comparison with tradeoffs, a code review
  aid, a plan with milestones and risks, a design or component sheet, a clickable prototype, an
  inline SVG diagram, a slide deck, a report or postmortem, or a small editor that exports
  markdown/JSON/config
- Don't use it when the answer is short, purely factual, or the reader asked for markdown

- Keep everything inline (CSS and JS), no CDNs, fonts, build steps, or network access; it must open
  straight from disk
- Keep the JavaScript small and purposeful, use semantic HTML, and make it work on narrow screens
- Include print styles for reports, plans, and decks
- Give it a clear title, a one line statement of what it helps with, and instructions for any
  controls
- If state is editable, include a copy or export button that returns something useful
- Use distinctive design for reader facing artifacts and stay functional for internal engineering
  ones; design should serve comprehension, not decorate it
- Critically must start the page with `<meta charset="utf-8">` before any other markup
- The file is opened over `file://` with no server charset header, so without this Safari falls back
  to a legacy encoding and any non-ASCII characters

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

