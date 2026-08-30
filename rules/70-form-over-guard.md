# Form over guard

## Prefer a form that makes the mistake inexpressible over a guard that detects it
A guard is a second thing to keep, and it only fires on the paths someone thought of. A type
that cannot represent the wrong state fires everywhere, for free, at compile time.
— `gaston: docs/guidelines/engineering-standards.md`

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
