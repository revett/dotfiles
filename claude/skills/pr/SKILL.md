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

Never add a footer or attribution line to the description, such as:

```text
🤖 Generated with [Claude Code](https://claude.com/claude-code)
```
