---
name: explain
description: Create a single HTML page to explain the given subject
---

# Instructions

- Exhaustively understand the given subject, then deeply think about it
- Output a single local HTML page to explain your investigation, thinking, plan, and recommendations
- Charlie should provide the subject of the plan (e.g. Linear ticket), if not then fail fast
- Most commonly the subject will either be the changes on the current branch, or a GitHub PR
- Subject can be anything, for example a Slack thread that the reader is looking to understand
- The point of this skill is to allow Charlie to focus on many tasks at once
- To then come back to a task to understand/review changes

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
