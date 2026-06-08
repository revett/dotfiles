---
name: pr-desc
description: Generate a very concise PR title and description for the current branch.
user-invocable: true
---

# GitHub Pull Request Description

## Task

Write a very concise title and description for a GitHub pull request for the current branch.

Open the output within TextEdit.

## Output

### Title

Format:

```text
<area> → <short_description>
```

Example:

```text
Ari → Remove search queries from logs
```

### Description

Must be in markdown, and include the following sections:

1. Problem
1. Changes
1. Why

Talk at a high level, don't go in to implementation details, that is what the code is for.

Bias towards brevity, and use bullet points where appropriate.

Do not use emojis.

Bullet points should only ever be a single sentence, feel free to lean on commas and semicolons to
make them longer, and do not use full stops at the end of each bullet point.

Do not include ticket numbers in the description.
