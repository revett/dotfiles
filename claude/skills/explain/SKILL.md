---
name: explain
description: Create a single HTML page to explain the given subject
---

# Instructions

- Exhaustively understand the given subject, then deeply think about it
- Output a single HTML page via `/html` to explain your investigation, thinking, plan, and
  recommendations
- Charlie should provide the subject of the plan (e.g. Linear ticket), if not then fail fast
- Most commonly the subject will either be the changes on the current branch, or a GitHub PR
- Subject can be anything, for example a Slack thread that the reader is looking to understand
- The point of this skill is to allow Charlie to focus on many tasks at once
- To then come back to a task to understand/review changes
