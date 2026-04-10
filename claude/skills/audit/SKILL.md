---
name: audit
description: Audit the dotfiles repo for docs, errors, unused config, tool overlap, Claude setup, and state of the art improvements.
user-invocable: true
---

# Audit

Full health check of Charlie's dotfiles repo. Read everything, research current best practices, and
produce a structured report directly in the conversation.

Speed is not the priority here; thoroughness is.

## Scope

The audit covers seven areas, each becoming a section in the final report. Run all research and file
reads in parallel where possible.

### 1. Documentation

- Is the README accurate? Does it reflect the current repo contents, install process, and tool list?
- Are there files or directories with no mention in any docs?
- Are there docs referencing things that no longer exist?

### 2. Errors and Inconsistencies

- Config files referencing tools, paths, or binaries that don't exist or are misspelled
- Shell config (.zshrc, .aliases, .functions) referencing commands that aren't installed via
  hops.yml
- Symlink targets in install.sh that don't match actual file paths in the repo
- Version mismatches, deprecated flags, or invalid syntax in any config file

### 3. Dead Weight

- Config files for tools not listed in hops.yml or referenced anywhere else
- Aliases or functions that duplicate each other or duplicate a tool's built in behaviour
- Shell config that's commented out or clearly unused
- Claude skills that overlap significantly or are never likely to be invoked

### 4. State of the Art

Research current best practices and trending tools from the last 3 months (early 2026). Focus on:

- Terminal emulators, shells, prompts
- Package managers and dotfile bootstrapping
- Git config and workflow tooling
- Editor/IDE config management
- Claude Code setup patterns (skills, hooks, agents, settings)

Only flag things that are a genuine improvement for Charlie's workflow, not novelty for novelty's
sake. Remember the monotropic style: switching cost is real, so the bar for "worth changing" is
high.

### 5. Claude Setup

- Is CLAUDE.md well structured? Anything redundant, contradictory, or missing?
- Are skills using frontmatter correctly and effectively?
- Are settings.json permissions and hooks configured well?
- Any opportunities for new skills or hooks that would save time?
- Is the split between CLAUDE.md (always on) and skills (on demand) sensible?

### 6. Tool Overlap

Review all tools installed via hops.yml and referenced in shell config:

- Are any tools redundant with each other? (e.g. two JSON processors, overlapping git tools)
- Could any tool be replaced by a built in or by another tool already in the stack?
- Are there tools installed but never referenced in config or aliases?

### 7. Quick Wins

Anything that doesn't fit the above but would take under 5 minutes to fix. Typos, missing
.gitignore entries, stale comments, minor improvements.

## Research

Use web search to check:

- Latest releases and deprecation notices for tools in hops.yml
- Current community consensus on dotfile management patterns
- Any Claude Code features or conventions that have shipped recently

## Output Format

Output the report directly in the conversation. Use the following structure:

```text
# Dotfiles Audit — YYYY-MM-DD

## Summary

<3-5 sentence overview of overall health, biggest findings, and top priority actions>

## 1. Documentation
## 2. Errors and Inconsistencies
## 3. Dead Weight
## 4. State of the Art
## 5. Claude Setup
## 6. Tool Overlap
## 7. Quick Wins

## Action Items

<ranked table of all recommended changes, with effort estimate (S/M/L) and priority (P1-P3)>
```

Within each section:

- Use ASCII tables for comparisons and summaries
- Use code blocks for specific file/line references
- Use tree diagrams where they clarify structure
- Bold only for section headers and table headers, not for emphasis
- Be opinionated; rank recommendations, don't just list options
