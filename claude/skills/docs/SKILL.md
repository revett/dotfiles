---
name: docs
description: Propose changes to Plain's docs based on changes on the current branch
---

Look at the changes on the current branch (local and remote), then look through Plain's
documentation using https://help.plain.com/llms.txt, and see if there are any obvious changes that
need to be made to the documentation given the changes. If so, output a new local HTML light theme
single page that describes the list of necessary changes, where each change is a section, which
includes:

- The name of the Help Center article
- Reasoning
- Impact and importance score
- Diff (non-editable)
