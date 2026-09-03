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
- After creating/updating a local HTML artifact, open it in the default browser with `open <path>`
- Use available tools (where appropriate) to help build context and a better understanding
- If applicable, include a sticky ToC sidebar, left of the main content that scrolls with the page
