# Completeness — the failures no test finds

## Is there a path from a person to every piece of data the behaviour depends on?
Everything the app *does* must be reachable from a screen, and everything the app *reads* must
be fillable from a screen. A feature that fails either half is complete, tested, green, and
**inert** — which is exactly why no test finds it: everything that is tested works.

- **Outward** — every command has a caller. A command with no affordance is a door with no
  handle. The loop that finds one is a dozen lines of shell, and it found an orphan on its
  first run — behind a green gate.
- **Inward** — every persisted field the behaviour reads has a screen that can write it.

The mechanical half of this rule was itself described in an ADR and **ran nowhere** for weeks:
the check was mechanical, the repository was not.
— `gaston: docs/architecture/adr/0042-a-rule-that-has-cost-twice-is-an-adr.md`

## A boundary that works by coincidence on part of its contract is worse than a broken one — it looks like it works
Two sides of a serialisation boundary disagreed on naming convention. Three fields were spelled
identically in both, so **chance decided which half of the contract worked**, and the working
half was the evidence that the boundary was fine. Two options were inert from the day they were
written, and both fell back to exactly the defaults, so the product behaved as documented and
only the diagnostic knobs lied.
**Any boundary crossing a language, a process or a wire needs one thing that fails when the two
sides stop naming the same fields** — and that guard **reads the other side**, rather than
restating its list. A restated list is what had just gone stale, in the other direction.

## A decided decision is not an enforced one
`accepted` answers *did we decide this*; it says nothing about whether anything keeps it. An
accepted decision with no keeper is the most dangerous shape a record can take — a written
guarantee nothing checks — and **it reads exactly like a finished one.**
The fix is a `Built` line naming, with a file path, what exists and what does not.
— `gaston: docs/architecture/adr/README.md` §"Why `Built` and not a third status value"

## A flexible track keeps an automatic minimum size until you disarm it
`min-w-0` in flexbox, `minmax(0, …)` in grid. What makes it treacherous is *when* it shows up:
it is invisible while nothing disputes the space, so it is not caught by reviewing the
component — **it is caught by adding something beside it.** The moment to re-read every `flex-1`
and every `1fr` is the moment you put a second column next to them.
