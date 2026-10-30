#!/usr/bin/env bash
# Claude Code status line.
# Layout: #<pr> • <branch> • <model> (<Effort>) • <ctx>% (<150k+>) • 5h <n>% (<reset>) / 7d <n>%
# Receives session JSON on stdin. See https://code.claude.com/docs/en/statusline
set -uo pipefail

# ── Palette (grey baseline; warm only for warnings) ───────────────────────
RESET=$'\033[0m'
DIM=$'\033[2m'
FG=$'\033[38;5;250m'      # all text shares one grey; bullets stay dim
YELLOW=$'\033[38;5;221m'  # warn
RED=$'\033[38;5;210m'     # hot
OVER_C=$'\033[38;5;203m'  # 150k+ flag
SEP=" ${DIM}•${RESET} "

# grey <70, yellow 70-89, red 90+
threshold() { local p=${1:-0}
  if [ "$p" -ge 90 ]; then printf '%s' "$RED"
  elif [ "$p" -ge 70 ]; then printf '%s' "$YELLOW"
  else printf '%s' "$FG"; fi
}

fmt_time() { local e=${1:-}; [ -z "$e" ] && return
  date -r "$e" +%H:%M 2>/dev/null || date -d "@$e" +%H:%M 2>/dev/null || true
}

# ── Extract ───────────────────────────────────────────────────────────────
# One jq call; fields joined with the unit separator so empty values don't collapse
IFS=$'\x1f' read -r PR DIR MODEL EFFORT PCT TOTIN FIVE FIVE_RST WEEK < <(jq -r '[
  .pr.number // "",
  .workspace.current_dir // .cwd // ".",
  .model.display_name // "?",
  .effort.level // "",
  (.context_window.used_percentage // 0 | floor),
  .context_window.total_input_tokens // 0,
  .rate_limits.five_hour.used_percentage // "",
  .rate_limits.five_hour.resets_at // "",
  .rate_limits.seven_day.used_percentage // ""
] | map(tostring) | join("\u001f")')

BRANCH=$(git -C "$DIR" branch --show-current 2>/dev/null || true)
MAXB=22
[ "${#BRANCH}" -gt "$MAXB" ] && BRANCH="${BRANCH:0:$((MAXB-1))}…"

# ── Segments ──────────────────────────────────────────────────────────────
SEGS=()

[ -n "$PR" ]     && SEGS+=("${FG}#${PR}${RESET}")
[ -n "$BRANCH" ] && SEGS+=("${FG}${BRANCH}${RESET}")

# model with effort folded in: "Opus 4.8 (High)"
M="${FG}${MODEL}${RESET}"
if [ -n "$EFFORT" ]; then
  E="$(tr '[:lower:]' '[:upper:]' <<<"${EFFORT:0:1}")${EFFORT:1}"
  M="$M ${FG}(${E})${RESET}"
fi
SEGS+=("$M")

# context % with 150k+ flag
CTX="$(threshold "$PCT")${PCT}%${RESET}"
[ "$TOTIN" -gt 150000 ] && CTX="$CTX ${OVER_C}($((TOTIN/1000))k)${RESET}"
SEGS+=("$CTX")

# rate limits: 5h <n>% (<reset>) / 7d <n>%
if [ -n "$FIVE" ] || [ -n "$WEEK" ]; then
  RL=""
  if [ -n "$FIVE" ]; then
    n=$(printf '%.0f' "$FIVE"); t=$(fmt_time "$FIVE_RST")
    RL="${FG}5h${RESET} $(threshold "$n")${n}%${RESET}"
    [ -n "$t" ] && RL="$RL ${FG}(${t})${RESET}"
  fi
  if [ -n "$WEEK" ]; then
    n=$(printf '%.0f' "$WEEK")
    W="${FG}7d${RESET} $(threshold "$n")${n}%${RESET}"
    RL="${RL:+$RL ${DIM}/${RESET} }$W"
  fi
  SEGS+=("$RL")
fi

# ── Join ──────────────────────────────────────────────────────────────────
out=""
for s in "${SEGS[@]}"; do
  out="${out:+$out$SEP}$s"
done
printf '%s\n' "$out"
