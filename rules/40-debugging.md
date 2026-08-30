# Debugging

## When a fix whose correctness you have established changes nothing, assume several causes — not that you were wrong
Superposed causes produce one symptom, and *"it still doesn't work"* is a single bit: no amount
of reasoning separates them. That is the moment to **instrument** — one question per
manipulation, saying in advance what each answer would eliminate — rather than to deduce again.
Paid on a title bar that was three independent defects wearing one sentence.

**The corollary is the expensive half**: a fix established as correct *independently of the
symptom* is kept and labelled "correct, effect masked" — **never reverted for having changed
nothing.** Reverting the first one would have hidden the third.

## And the converse holds just as often: one cause produces symptoms that share no words
A single wrong width made *"the brand is glued to the lights"* **and** *"the lights sit too
high"*. A single broken height chain made *"the cards are 140px"* **and** *"Thursday is cut
off"* — reported days apart, on different screens.
So **a symptom says nothing about the number of causes, in either direction.** Neither "it's the
same bug" nor "it's a new one" is deducible from the account; both are measured.
Its sharpest form: a property that **never held structurally** and only looked held is
*revealed*, not introduced, the day a neighbour arrives.

## Going up to the cause widens the radius, and measuring the new radius is part of going up
Otherwise N known defects become M unknown ones. Measured once at three gate rounds for a
cosmetic fix on four literals, because the four derived from a helper that existed in five copies.
— `gaston: docs/guidelines/testing.md` §« remonter à la cause élargit le rayon »

## A mechanism read in the source does not say what it produces
Between the fact and its consequence there is a measurement, and a solid fact does not stand in
for it. **An uncertainty you flagged does not cancel itself by being repeated**: if a step is
marked *to be verified*, nothing may rest on it until it is.
— `gaston: docs/guidelines/testing.md` §« la source lue juste, la conséquence supposée »

## A rename preserves position, not order
Before a mass rename, find every expectation whose order derives from the renamed values (a
sorted-map key, a `sort_by`, a sorted literal). Searching costs one command; finding them
through red costs one gate per round.
