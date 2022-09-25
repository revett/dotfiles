#!/usr/bin/env bash
#
# Gmail Filter Generation
#
# This script generates a number of Gmail compatible filters, aimed at helping
# to manage unwanted emails. Currently it supports:
#
# - allowlist: List of trusted domains
#
# Usage: ./generate-filters.sh
#
# @author Charlie Revett

f="$HOME/dotfiles/email/allowlist.txt"
r=""
i=0

echo "> generating $f"
echo "> sorting (a-z) lines"
sort -o $f $f

while IFS= read -r domain; do
  ((i=i+1))

  if [ $i -eq 1 ]; then
    r="-$domain"
    continue
  fi

  r="$r -$domain"
done < "$f"

echo -e "> filter:\n"
printf -- "from:($r)\n\n"
echo -e '> Do this: Apply label "External"'
