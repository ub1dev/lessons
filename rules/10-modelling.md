# Modelling

## Two situations that lead to the same emptiness need two types
Not one `Option`. The anti-pattern to recognise: a struct holding a result plus a
possibly-empty list of caveats, which a caller can render without ever reading.
**The test**: do the two empties have different *answers*? If a caller would act differently,
they are two types. One emptiness with one meaning stays a plain `Option` — this can be
over-applied into ceremony, and the counter-case is in the ADR.
Paid five times, once overturning an already-signed decision.
— `gaston: docs/architecture/adr/0028-two-emptinesses-need-two-types.md`

## Unreadable is not absent
The sharpest instance of the rule above, and the one that keeps recurring: a quantity you
could not measure is not a zero. Zero is the value a broken instrument returns spontaneously.

## A fact is recorded as stated; the interpretation is derived when read
Record what was *said*, in the words it was said in. Anything that has to be worked out from
it is worked out at read time, every time.
**The test**, whenever a value could be stored either way: *if we later learn this was wrong,
can it still be fixed?* An inference belongs on the side where the answer is yes.
— `gaston: docs/architecture/adr/0035-a-fact-is-recorded-as-stated-and-reconciled-when-read.md`

## What a component learns about its *input* stays beside the contract, never in it
Whatever the provider computed about the raw material — geometry, resolution, how many
frames, how long it took — rides alongside the result, not inside it.
**The test**: *could a different implementation, seeing only the same input, fill this field
in honestly?* If it would have to make something up, the field belongs beside the contract.
Paid three times.
— `gaston: docs/architecture/adr/0032-what-a-provider-learns-about-the-photograph-stays-beside-the-contract.md`

## No threshold is a fraction of its container
A quantity is measured against a robust statistic of **the subject** — a mode, a median, a
cluster — never against a min/max and never against the dimensions of whatever happens to
contain it.
**The test**: *if I crop the container tighter, does this number change?* If yes, it is wrong.
Dimensionless ratios of two quantities *of the subject* are fine.
Paid four times in four days, including once by the person who had just written the rule
down — because an extent is two extremes wearing a coat.
— `gaston: docs/architecture/adr/0033-no-geometric-threshold-is-a-fraction-of-the-frame.md`

## An approximation's threshold depends on who decides after it
Loose when a person answers a direct question; tight when the machine proposes and the person
may accept without thinking. Design the question first and the tolerance second: a human
confirmation is what **pays for** looseness, never an apology for a weak match.
— `gaston: docs/architecture/adr/0034-an-approximations-threshold-depends-on-who-decides-after-it.md`

## A name is a cost, and a wrong one routes people
A name the user reads and a name only we read are two different costs, and a boolean is a
name too. A misnamed flag does not merely confuse — it sends the next person down a branch.
— `gaston: docs/guidelines/engineering-standards.md` §« A name the household reads… », §« A boolean is a name too »
