---
name: do
description: Execute a task, with the surrounding logistics
---

# Instructions

The skill helps you execute a task, with the surrounding logistics. Charlie will either be
discussing a task with you, or pass something to you that need to be done.

1. In a `team-plain` repo, the task must have a Linear ticket; if the prompt has no key, create one
   (see CLAUDE.md) before touching code
2. `gcb` on to the ticket's branch (Linear's `gitBranchName`)
3. Do the work
4. After finishing the work, use the `/decomment` skill to ensure we don't have comment slop
5. Commit, push, and open a draft PR via `/pr`, updating it if future changes are needed
