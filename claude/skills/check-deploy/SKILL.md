---
name: check-deploy
description: Monitor team-plain/services after a merge to main. Checks pipeline, Sentry, Datadog, and Slack for issues.
user-invocable: true
---

# Check Deploy

Monitor `team-plain/services` after a merge to main. PR number is required; ask if not provided.

## Setup

1. Find the deploy run: `gh run list --workflow=deploy.yml --limit=5 -R team-plain/services` and
   match by commit message containing `(#<pr>)`. Note the run ID.
2. Get PR context: `gh pr view <pr> -R team-plain/services`

## Loop

Always loop. Sleep 60s between checks. Stop conditions:

- 3 consecutive clean checks after prod-uk completes → report healthy, stop
- Pipeline failure → report immediately, stop

## Sources

Check all in parallel using subagents. Do not skip any.

1. **Pipeline**: Check run status via `gh run view <run-id> -R team-plain/services`
2. **Sentry**: New or escalating issues in the last 15 minutes
3. **Datadog**: `ERROR` logs in the last 15 minutes, all services
4. **Slack** (last 30 min of each):
   - `#prod-alerts-live` (C084FHANYRH)
   - `#notif-sentry` (C07NGE33UNR)
   - `#notif-ai` (C09FHFSEEN4)
   - `#notif-ai-feedback` (C09RUF0NUSZ)

## Output

```text
## Check Deploy — HH:MM (N/3 clean)

**Pipeline**: <status> (run <id>)
**Stage**: <current stage or completed>

| Source        | Status    | Notes           |
| ------------- | --------- | --------------- |
| Sentry        | ✅ / ⚠️ / ❌ | <brief summary> |
| Datadog       | ✅ / ⚠️ / ❌ | <brief summary> |
| Slack alerts  | ✅ / ⚠️ / ❌ | <brief summary> |
| Slack AI feed | ✅ / ⚠️ / ❌ | <brief summary> |
```

- ✅ Clean
- ⚠️ Pre-existing only
- ❌ New issues possibly caused by the deploy

Be concise; summarize, do not dump raw logs.
