#!/usr/bin/env bash
# Every `<project>: <path>` citation in rules/ must resolve to a real file.
#
# This exists because the rules it checks say so: a claim about elsewhere must be bound to it
# (rules/20-claims.md), and whatever verifies the repository belongs in the repository
# (rules/50-gates-and-automation.md). It reads the cited path rather than restating a list.
#
# The project prefix is NOT a hard-coded list. A prefix counts as a project when a sibling
# directory of that name exists beside this repository — so a rule may cite any ub1dev project,
# and adding one needs no edit here. Restating the list is what goes stale.
#
# Three outcomes, and the third is the reason they are counted separately:
#   resolved  — the sibling is checked out and the file is there.
#   MISSING   — the sibling is checked out and the file is not. A failure.
#   unchecked — the sibling is not checked out at all. NOT a failure: a solo clone of this
#               repository must be able to pass its own check. Reported so the silence is
#               never mistaken for a clean bill.
set -euo pipefail
here="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
siblings="${SIBLINGS_ROOT:-$here/..}"

missing=0; found=0; unchecked=0; declare -A absent=()

while IFS= read -r citation; do
  body="${citation//\`/}"
  project="${body%%:*}"
  path="${body#*: }"
  [ -z "$project" ] && continue
  found=$((found + 1))
  if [ ! -d "$siblings/$project" ]; then
    unchecked=$((unchecked + 1)); absent["$project"]=1; continue
  fi
  if [ ! -e "$siblings/$project/$path" ]; then
    echo "MISSING: $project/$path"
    missing=$((missing + 1))
  fi
done < <(grep -rhoE '`[a-z][a-z0-9-]*: [^` ]+`' "$here/rules")

if [ "$found" -eq 0 ]; then
  echo "FAIL: no citation found at all — this check would pass on an empty directory"
  exit 1
fi

echo "$found citations · $missing missing · $unchecked unchecked"
if [ "$unchecked" -gt 0 ]; then
  echo "  (not checked out beside this repository: ${!absent[*]})"
fi
[ "$missing" -eq 0 ]
