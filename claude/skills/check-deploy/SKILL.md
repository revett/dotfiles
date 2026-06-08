---
name: check-deploy
description: Babysit and monitor deploy, by checking for issues with and after a deploy
---

# Task

Monitor the deployment of a given PR (should be provided), and then check for issues after the
change is deployed. Check for pipeline issues, Sentry issues, Datadog logs, Slack alert; all that
are related to the change. Make use of subagents to check in parallel. Use a loop to check and then
sleep for 30s between checks. Output findings each time as a useful ASCII table. You are there to
find issues, not to fix them.

