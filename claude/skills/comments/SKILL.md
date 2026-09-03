---
name: comments
description: Fix open comments on the current GitHub PR
disable-model-invocation: true
---

# Instructions

1. Fetch open comments on the current GitHub PR
2. Consider each comment, and determine if it should be fixed or ignored
3. Fix each comment that should be fixed
4. Output a table within the chat when done outlining the comments, whether they were fixed or
   ignored, and if ignored, the reason why

Do not commit the changes, or reply to the actual comments on GitHub.
