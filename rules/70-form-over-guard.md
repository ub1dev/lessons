# Form over guard

## Prefer a form that makes the mistake inexpressible over a guard that detects it
A guard is a second thing to keep, and it only fires on the paths someone thought of. A type
that cannot represent the wrong state fires everywhere, for free, at compile time.
— `gaston: docs/guidelines/engineering-standards.md`

## A form that nothing asks is a guard nobody wrote
A type that makes the wrong state inexpressible earns nothing until some caller can reach the
question it answers. Three times in one repository a form argued as *the face cannot print the
wrong thing* was sabotaged — the wrong arm made to return the value anyway — and **the whole
suite stayed green**, because every caller had already branched before the question was asked.
An `Option` nothing unwraps, a constructor parameter nothing omits, a refusal every path
short-circuits before reaching: each was correct and each was proving nothing.
**Sabotage the form, and if the suite stays green, write the test that asks it directly** — a
pure function called with the one case the live path can never produce. The form is still the
right shape; the test is what makes it a claim.
— `doctor-house: crates/doctor-core/tests/standing.rs`
— `doctor-house: crates/doctor-cli/src/consent.rs`

## Replace the whole value, or protect the field. Never assign it
A partial assignment is the shape that survives a refactor and means something else afterwards.

## A check belongs where the other checks are, even when it is longer that way
A check placed where it was convenient is a check nobody will find when they add the next one.

## Moving a component: ask what side effects the old caller was holding
The component moves; the effects the parent was quietly performing on its behalf do not.

## An action that restores sounds safe, and that is what stops anyone asking
"Reset", "restore", "revert", "clean" — the word does the reassuring, and nobody checks the
blast radius. Ask what it deletes, and ask it out loud.

## « Rarement » that becomes « jamais » means the modelled quantity is the wrong one
When the exceptional case stops occurring entirely, the model is not merely conservative — it
is about something else.

## When a task asks for something the code makes unreachable, the task is wrong
Not the code, and not silently either: say so, with the file and the line.
