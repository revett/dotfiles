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
- After creating/updating a local HTML artifact, open it in the default browser with `open <path>`
- Use available tools (where appropriate) to help build context and a better understanding
- If applicable, include a sticky ToC sidebar, left of the main content that scrolls with the page
