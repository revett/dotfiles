---
name: pr-desc
description: Generate a very concise PR title and description for the current branch
---

# Task

Write a very concise title and description for a GitHub pull request for the current branch. Open
the output as a temporary editable HTML tab in the browser.

Title format:

```text
<area> → <short_description>
Ari → Remove search queries from logs
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
modifiers (write "production grade" not "production-grade", "real time" not "real-time" etc).
