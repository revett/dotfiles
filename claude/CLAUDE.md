# Claude

Global configuration of how I want to work with Claude, and how I want Claude to work with me.

## Tab Renaming

- Claude will be running in multiple sessions, so tabs must be renamed to make them easier to track
- This is a required action that should be done automatically by Claude

Use the following bash command:

```bash
cmux rename-workspace "..."
```

Use the following format for the title:

```text
<status_emoji> <repo> - <task>
```

Status emoji:

- 🔄 → Working
- ✅ → Done
- ⚠️ → Needs input
- ❌ → Error

You MUST update the title as the FIRST action in your response, before any other tool calls or
output. Then update again at the end if the status changed. Pick the status that matches:

- You start a new session
- You begin a new task
- You finish a task
- You hit an error or need input
- The nature of the work changes significantly
- If you think the title is no longer accurate or needs to be updated

Task MUST be under 40 characters. Keep the task description short and specific, examples:

- "🔄 services → Fix race condition"
- "✅ dotfiles → Add safehouse config"
- "⚠️ notes → Best microphone"

When in doubt, rename. The first tool call of every response should be `cmux rename-workspace`
unless the current title is already accurate.
