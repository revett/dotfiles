---
name: pr
description: Generate a very concise PR title and description for the current branch
---

# Instructions

Write a very concise title and description for a GitHub pull request for the current branch, then
push the branch and open it as a draft with `gh pr create --draft --title <title> --body <body>`. If
a PR already exists for the branch, update it with `gh pr edit --title <title> --body <body>`
instead. Never request reviewers, and never mark the PR as ready for review. In a `team-plain` repo,
stop if the branch has no Linear ticket and create one first (see CLAUDE.md).

Title format:

```text
[TICKET_NUMBER] <area> → <short_description>
[ARI-1884] Knowledge Sources → Remove search queries from logs
```

Description must be in markdown, and include the following sections:

1. Problem: a single sentence of 100 to 200 characters, never a list
2. Changes: a numbered list of up to 5 items, each under 140 characters
3. Why: a single sentence of 100 to 200 characters, never a list

Talk at a high level, don't go in to implementation details, that is what the code is for. Bias
towards brevity; if a change doesn't fit in 5 items under 140 characters, it is too detailed. Do not
use emojis. Each list item should be a single sentence, with no full stop at the end. Do not include
ticket numbers in the description. The first word of each list item should be capitalised. Make use
of inline code blocks where appropriate. Avoid using hyphenated compound modifiers (e.g.
"production-grade", real-time" etc), use different words instead.

Before the start of the "Problem" section of the description, there should be a line that reads
"Resolves [TICKET_NUMBER](TICKET_URL)", with a link to the Linear ticket, and a newline under it. If
the ticket is part of a Linear project, append ", part of the [PROJECT_NAME](PROJECT_URL) project."
to that line; otherwise leave it out.

Rarely, when there is something the reviewer must know (e.g. merge order, a manual step, a risky
deploy), add a GitHub `[!IMPORTANT]` callout under the "Resolves" line. It must be a single sentence
under 140 characters. Leave it out by default.

Never add a footer or attribution line to the description, such as:

```text
🤖 Generated with [Claude Code](https://claude.com/claude-code)
```

## Example

````markdown
Resolves [ARI-2350](https://linear.app/plain/issue/ARI-2350), part of the [Customer Agent Agentic Loop](https://linear.app/plain/project/customer-agent-agentic-loop-e357375c96c6) project.

> [!IMPORTANT]
> Must be merged before [#12631](https://github.com/team-plain/services/pull/12631), which reads `urgency` from the handoff.

## Problem

The loop's `hand_off` only had four blockers and no urgency, so most v3.2 handoff reasons became `other` and urgent handoffs looked normal

## Changes

1. Extend `blocker` with five new reasons that match v3.2's handoff classifications
2. Add a required `urgency` argument (`normal`, `high`, `urgent`) that the model chooses
3. Export shared maps from blocker to `AgentHandoffReason` and from urgency to thread priority
4. Add v3.2's note labels for the new blockers, with snapshots
5. Log `handoffReason` and `urgency` on the shadow summary line

## Why

Thread side effects and reporting need the same handoff reasons and urgency that v3.2 records, so the loop can replace it without losing data
````
