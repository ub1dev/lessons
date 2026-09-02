# The words these rules use

This vocabulary is **not** any project's domain vocabulary, and the separation is the point.
A project's words come from the household, the patient, the customer. These come from the work
of building. `gaston` has an `écart` that is a household fact and an `écart` that is a
measurement of our own delivery; one list could only ever have held one of them, and the one it
dropped would have gone on being used anyway, undefined.

**What goes in**: a word used in at least two of these rule files, or a word that already means
something else inside a project. That bar is measurable, and it was measured — not estimated.

**What stays out**: the vocabulary of a conversation. *sabotage*, *levier*, *lot* are words we
say to each other; they appear in none of these files. A vocabulary that admits them stops being
the corpus's vocabulary and becomes a record of someone's habits — the same failure the entry
criterion in `README.md` guards the rules against.

**An entry** is the word, one sentence, and where it is used. Never the case: that stays where it
happened, for the reason in `README.md` § "Why these files cite instead of retelling".

## Measuring

**instrument** — anything built to produce a number or a verdict you intend to cite afterwards: a
test, a script, a probe, a rig thrown away the same hour. The word is deliberately wide because
the failures do not care about the shape.
— `30-instruments.md`, in four of its seven rules

**rig**, **harness** — an instrument built for one question and not kept. The shorter life is not
a lighter standard; the rule separating a rig that reads the code from one that rebuilds it from
memory is the sharpest thing in this corpus.
— `30-instruments.md` §"A rig that reconstructs the code cannot measure it"

> `rig`, `harness`, `instrument` and — in gaston's French documents — `mire` all name this same
> thing. Four names for one concept is a cost this file can record but not remove.

**the knob** — the *input* side of an instrument: what you set, as against what you read. It has
its own name because it has its own failure, and that failure is the silent one.
— `30-instruments.md` §"An instrument fails at its input as well as at its output"

**proxy** — a number standing for a quality it does not itself measure. A proxy is legitimate; an
*unidentified* proxy is a false reading carrying the authority of a measurement.
— `30-instruments.md` §"A metric whose meaning you assume without reading what it counts"

**green** — the state of a check that passed. Used as a noun throughout, and never as evidence on
its own: a green obtained from a dead link, a moving tree, or a check that has never once been
red is a green about nothing.
— `50-gates-and-automation.md` §"A gate that runs while the tree is being edited"

## Judging

**fact** / **claim** — a *fact* is a sentence about the thing you are attached to. A *claim* is a
sentence whose subject is somewhere else. The distinction is grammatical, not a matter of
confidence: a true claim is still a claim, and that is the half review never catches.
— `20-claims.md` §"A sentence whose subject is somewhere else"

**the test** (of a rule) — the five-second question carried by each entry here, asked at the
keyboard by a person before the cost. Nothing runs it. In a corpus this much about testing, the
collision is worth stating: *the test* is never a software test.
— `00-how-to-read-these.md`

**threshold** — a number a decision turns on. Two rules constrain every one of them: what it is
measured against, and who decides after it.
— `10-modelling.md` §"No threshold is a fraction of its container", §"An approximation's threshold"

## Building

**the gate** — the ordered sequence of checks run once, immediately before a commit, on a tree
nobody is editing. Singular on purpose: a project has one, and a check that is not in it is not
in the gate whatever else runs it.
— `50-gates-and-automation.md`, in four of its seven rules

## Words that already mean something in a product

The domain half of each of these lives in the project, and is not restated here. `gaston` keeps
its half in `docs/architecture/ubiquitous-language.md`, under *"Words that mean two things"*.

| word | here, in the method | there, in a product |
|---|---|---|
| `écart` | a measured difference between what was delivered and the reference it was built from — `gaston: docs/design/ecarts/` | a household's departure from its own plan — `gaston: crates/gaston-core/src/household.rs` |
| `dérive` | a guard's verdict that a committed artefact no longer matches the source it was built from — `gaston: scripts/build-icons.sh` | one letter from `dérivé`, and gaston derives its whole stock from the journal: the guard shouts a word the architecture already owns |
| `glossary` | a list of words with their meanings — this file's kind | a feature of the product itself — `gaston: crates/gaston-core/src/glossary.rs`, which is why gaston's own list is called an *ubiquitous language* and not a glossary |

`gaston`'s list deliberately omits `écart` from its own collisions: its second sense is a method
word, and it belongs on this side of the line.
— `gaston: docs/architecture/adr/0052-the-ubiquitous-language-is-derived-and-cited.md`
