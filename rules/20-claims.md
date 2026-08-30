# Claims, comments and documents

## A sentence whose subject is somewhere else is a claim, not a fact
Bind it (something reads the subject and fails), cite it (`stock.rs:412`, not "the fold"), or
narrow it to what is true of the thing you are attached to.
**The tell is grammatical**: *is the subject of this sentence the item I am attached to?*
Paid five times in fifteen days. Three were **true when written** — which is why review never
catches that half. Two were **wrong when written**, about a file the author had not opened —
the more expensive half, and the reason this is not only a rule about comments going stale.
It applies hardest to audits, reports and ADRs, which are nothing but sentences about elsewhere.
— `gaston: docs/architecture/adr/0043-a-claim-about-elsewhere-must-cite-it-or-be-bound-to-it.md`

## A doc comment may state what *this* function guarantees, never what another one does
A claim about somebody else's behaviour is the only kind of comment nothing can falsify: the
compiler does not read it, the other function's tests do not know it exists, and it silences
the very question that would have found the bug. If a composition matters enough to write a
sentence about, it matters enough to have a test — **name that test in the comment.**
Cost a fortnight.
— `gaston: docs/guidelines/rust.md`

## A consequence about behaviour that does not exist yet is written in the conditional
*"Undo would always be possible"* until there is a test, then *"undo is always possible"* with
the test named. An ADR's Consequences section is the one place in a repository that describes
a future, and it has **no natural reader once that future arrives**. The conditional costs one
word and makes the unverified claim look unverified.
— `gaston: docs/architecture/adr/template.md`

## A comment block of ten lines or more must cite a decision
A block that cannot cite an ADR, a doc path or a task id is carrying a story that exists
nowhere else. The criterion never says *delete*, it says **cite**: write the story where
stories live, then reduce the block to the reference.
What justifies a comment: a constraint not deducible from the code, a reason **not** to do the
obvious thing, a decision reference. What does not: what the code already says, or how we got here.

## The story goes in the commit message and in the ADR — both versioned and dated
Never in the file, never in a report. A report carries what was done (one line each), the
decisions and their non-obvious reasons, the numbered questions with the option taken on
silence, the measurements, the failures, and what was **not** done. Saying the owner is wrong,
with the argument, is the most useful thing a report contains.

## An edit anchored on a text pattern can land inside a comment, and nothing will notice
`sed`, a `str.replace`, an `rfind`: any of them can cut a doc comment in two, and two fragments
of a doc comment are two valid doc comments — it compiles, the tests pass, and the result reads
as deliberate. **Refuse an anchor that falls inside a comment block rather than nudging it**,
and after any scripted edit read the diff of the comment lines:
`git diff -U0 | grep -E "^[+-]\s*(///|//!|//|\*)"`.
Found once, and only because the formatter happened to print those lines while complaining
about something three lines away.
— `gaston: docs/guidelines/testing.md` §« Une édition ancrée sur un motif textuel… »
