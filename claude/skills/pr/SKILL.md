---
name: pr
description: Generate a very concise PR title and description for the current branch
---

# Instructions

Write a very concise title and description for a GitHub pull request for the current branch. Do not
write any HTML. The page already exists at `~/.claude/skills/pr/template.html`; you only fill in
three placeholders:

1. Copy the template to `~/projects/scratchpad/`, named `YYYY-MM-DD-HHMM_<ticket>_pr.html`, dropping
   the `<ticket>` part if there is no ticket
2. In the copy, replace `__PAGE_TITLE__` with the PR number and ticket number if available,
   `__TITLE__` with the PR title, and `__DESCRIPTION__` with the markdown description
3. Open the copy in the browser (see "Opening in Browser" below)

Title format:

```text
[TICKET_NUMBER] <area> → <short_description>
[ARI-1884] Knowledge Sources → Remove search queries from logs
```

Description must be in markdown, and include the following sections:

1. Problem
2. Changes
3. Why

Talk at a high level, don't go in to implementation details, that is what the code is for. Bias
towards brevity, and use bullet points where appropriate. Do not use emojis. Bullet points should
only ever be a single sentence, feel free to lean on commas and semicolons to make them longer, and
do not use full stops at the end of each bullet point. Do not include ticket numbers in the
description. The first word of each bullet point should be capitalised. Make use of inline code
blocks to highlight parts of a bullet point where appropriate. Avoid using hyphenated compound
modifiers (e.g. "production-grade", real-time" etc), use different words instead.

Before the start of the "Problem" section of the description, there should be a line that reads
"Resolves [TICKET_NUMBER](TICKET_URL)", with a link to the Linear ticket, and a newline under it.

## Critical

- Do not be agreeable, strong opinions are welcome
- Use subagents if relevant to be more effective in your task
- If creating a local artifact, ensure to save it to the [scratchpad](~/projects/scratchpad)
- Feel free to update and use an existing artifact if that makes sense
- If helpful to your task, ask Charlie to fetch data/context manually for you, where you lack access
- Keep Charlie updated on your progress as you complete the task
- Always use a light theme when creating HTML artifacts
- After creating/updating a local HTML artifact, open it in the default browser with `open <path>`
- Use available tools (where appropriate) to help build context and a better understanding
- If applicable, include a sticky ToC sidebar, left of the main content that scrolls with the page
