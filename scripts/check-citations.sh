#!/usr/bin/env bash
# Every "gaston: <path>" in rules/ must resolve to a real file.
#
# This exists because the rules it checks say so: a claim about elsewhere must be bound to it
# (rules/20-claims.md), and whatever verifies the repository belongs in the repository
# (rules/50-gates-and-automation.md). It reads the cited path rather than restating a list.
set -euo pipefail
here="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
gaston="${GASTON_ROOT:-$here/../gaston}"
missing=0
found=0
while IFS= read -r line; do
  path="${line#*gaston: }"
  path="${path%%\`*}"
  path="${path%% *}"
  found=$((found + 1))
  if [ ! -e "$gaston/$path" ]; then
    echo "missing: $path"
    missing=$((missing + 1))
  fi
done < <(grep -rhoE 'gaston: [^` ]+' "$here/rules")

if [ "$found" -eq 0 ]; then
  echo "FAIL: no citation found at all — this check would pass on an empty directory"
  exit 1
fi
echo "$found citations, $missing missing"
[ "$missing" -eq 0 ]
