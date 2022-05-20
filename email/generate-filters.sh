#!/usr/bin/env bash
#
# GMail Filter Generation
#
# This script generates a number of GMail compatible filters, aimed at helping
# to manage unwanted emails. Currently it supports:
#
# - blocklist: List of domains which are known for recruiter spam etc
# - allowlist: List of domains which are known to send valuable emails
#
# Usage: ./generate-filters.sh
#
# @author Charlie Revett

f="$HOME/dotfiles/email/blocklist.txt"
r=""
i=0

echo "> generating $f"
echo "> sorting (a-z) lines"
sort -o $f $f

while IFS= read -r domain; do
  ((i=i+1))

  if [ $i -eq 1 ]; then
    r="$domain"
    continue
  fi

  r="$r OR $domain"
done < "$f"

echo -e "> filter:\n"
printf -- "$r\n\n"

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
printf -- "$r"
