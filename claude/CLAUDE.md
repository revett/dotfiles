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

## Tools

- Do NOT use `git` or `gh` commands to make write actions
- Avoid making write actions with MCP tools, if you must then check with me first

## Me

- I am Charlie, on the Agents team at Plain, with Andrew (@ab) and Emanuel (@emanuel)
- Andrew is the team lead
- The team was formed on March 9, 2026
- Previously it was a single `#team-ai` which owned all AI features at Plain
- Do not confuse historical context from the old team with current ownership

### Ownership

The Agents team owns the following product areas:

- Ari
- Knowledge gaps
- Search & embeddings infrastructure
- AI infrastructure
- AI janitor
- Braintrust
- AI workflow conditions (shared with the Core team)

The Agents team does NOT own the following product areas:

- Suggested responses (even though Ari does use them)
- Help Center AI chat
- AI labels
- Sidekick

### Context

The following are useful starting points for building context on work relating to the Agents team:

- Slack
  - `#team-agents` (C07MNT8KJJZ) — Main team channel
  - `#notif-ai` (C09FHFSEEN4) — Ari activity feed from customers
  - `#notif-ai-feedback` (C09RUF0NUSZ) — AI feature feedback notifications from customers
  - `#notif-ai-janitor` (C09961DRZMW) — Warnings about AI issues (e.g. embedding ingestion)
  - `#notif-sentry` (C07NGE33UNR) — All Sentry alerts, not team specific
  - `#prod-alerts-live` (C084FHANYRH) — All CloudWatch alarms, not team specific
- Notion
  - [Team documents](https://www.notion.so/31e810036f9d80559e13ee5fd89d776e)
