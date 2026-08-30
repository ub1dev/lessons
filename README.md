# ub1dev/lessons

Rules that have already cost something, in one place, read by every ub1dev project.

**Entry criterion, in the name.** Nothing goes in that was not *learned*. A rule that has
not cost anything yet is a preference, and preferences do not travel between projects.
The bar, borrowed from gaston's ADR-0042: **a rule that has cost twice is written down.**
On one occurrence it waits.

## How a project reads it

```bash
ln -s ~/dev/ub1dev/lessons/rules .claude/rules/lessons
```

`.claude/rules/` follows symlinks. One file, one home, no second copy to keep in step.

## Why this is not a copy

`~/dev/ub1dev/standards/` tried the other shape: copy into each project, fold refinements
back "when they prove out". Nothing was ever folded back — not once in six weeks, while the
copy in gaston grew by a factor of fifty. A copy plus a manual promise is two lists kept by
hand, and two lists kept by hand diverge. That is not a discipline failure; it is the shape.
`standards/README.md` records it in full.

## Why these files cite instead of retelling

Every rule here was paid for in **gaston**, and the payment — the dated case, the file, the
number — still lives there and still moves. `standards/README.md` deferred this extraction
for exactly that reason: *"rewriting a moving source is the mistake this file already
records once."*

So a rule here is **the rule and its test, plus a citation** — never a retelling of the
case. The case stays where it happened, and re-reading it is one `less` away. This is
gaston's ADR-0043 applied to this repository: *a claim about elsewhere must cite it, be
bound to it, or not be made.* When a citation goes stale, the fix is the path, not a
paraphrase.

Citations are written `gaston: <path>` and are relative to `~/dev/ub1dev/gaston/`.

## Readers

| project | since |
|---|---|
| [gaston](../gaston) — family meal planner (Tauri, Rust) | source of every rule here |
| [doctor-house](../doctor-house) — dev-machine diagnosis (Rust, CLI + Raycast + tray) | 2026-08-30, first reader that did not write them |
