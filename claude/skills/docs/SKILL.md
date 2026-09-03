---
name: docs
description: Propose changes to Plain's docs based on changes on the current branch
---

# Instructions

- Look at the changes on the current branch (local and remote)
- Then look through Plain's documentation using [Help Center](https://help.plain.com/llms.txt)
- See if there are any obvious changes that need to be made to the documentation given the changes
- Output a single local HTML page to explain your investigation, thinking, plan, and recommendations
- It should be a list of necessary changes, where each change is a section, which includes:

```plaintext
1. The name of the Help Center article
2. Reasoning
3. Impact and importance score
4. Diff (non-editable, and ensure renders correctly for easy copying)
```

- We want the best possible documentation for our customers
- So don't be afraid to suggest edits, deletes, additions, new pages, page splits, or anything else!
- You are here to ensure we have A+ quality documentation

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
