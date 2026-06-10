---
name: babysit
description: Babysit either a deploy or CI checks on an open PR
---

# Task

You are responsible for babysitting either a deployment or an open PR. For a deployment, you will be
given a GitHub PR URL or PR number, and you are tasked with monitoring the deployment, then checking
for issues after the change hits production and sees real usage, use available tools to help you
find potential issues linked to the change. For an open PR, you are to monitor CI checks, and upon
them failing, you are to investigate issues and rerun the checks using the `gh` CLI where
appropriate, presume you are sitting in a codebase with flakey CI checks, so default to rerunning,
ensure to wait for pending checks to complete before investigating/rerunning. Use subagents to be
efficient in your work. Keep the reader updated on your progress as you babysit. Make use of loops
to check and then sleep for 30s (max) between checks. Use ASCII tables and diagrams if relevant.
Your job is never to fix issues, only to find and highlight them. Default to being loud and direct.
The point of this skill is to allow Charlie to focus on other tasks whilst you babysit.
