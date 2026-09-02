# Instruments and measurement

## An instrument fails at its input as well as at its output, and the input failure is the quiet one
*Output*: the instrument printed where nobody was reading — the tell was that nothing appeared.
*Input*: the knob never reached the thing it was turning, so every reading was honest,
correctly reported, and **about nothing**. The second has no tell at all, because *"no change"*
is exactly what a disconnected knob produces — indistinguishable from a real negative result,
and it gets written down as one and cited as evidence afterwards.
**Before trusting an experiment that found nothing, prove the knob moves something**: set it to
an absurd value and check the output changes.
— `gaston: docs/guidelines/testing.md`

## A guard needs a specimen of the condition, not a simulation of its label
A version check tested by editing the version field of a **current** file tests the comparison
and nothing else. The guard's real input is a file of the *older shape*, and until one exists
nobody has run its actual case.
Paid literally: the check was **unreachable** in the one situation it was written for. `replay`
deserialised the whole capture and compared versions afterwards, so an old file died on its first
missing field and the reader got `missing field 'process_group' at line 47` instead of *this file
is format 1*. The existing test passed throughout, because it tampered with the version of a file
whose shape was current — the easy half.
**The tell**: ask what the guard's input looks like in the wild, then ask whether the fixture is
that thing or a hand-set flag standing for it.
**Corollary, paid the same hour**: *adding* a required field is as breaking as changing one — a
recording written before the field existed cannot be read after it — and it does not feel like
it, which is why a comment claiming the opposite survived from the day the file was written.
— `doctor-house: crates/doctor-probe/tests/record_replay.rs`
— `gaston: docs/guidelines/testing.md` §"A test that cannot express the fault it guards does not guard it"

## A caveat written down is not a caveat honoured
A test whose own comment says *"this assumes a machine with a desktop session"* and which then
asserts it unconditionally three lines later does not assume — it **claims**. The assumption was
recorded and nothing enforced it, which is the same shape as an uncertainty flagged and then
rested on (`40-debugging.md`), committed inside an instrument.
**The form that holds: the test creates the condition it measures.** Bind a loopback port and
require the probe to find *that* port on *this test's own pid*, rather than counting whatever the
machine happens to be running. It is also stricter — it names the pid and the port instead of
counting — so honouring the caveat cost nothing and bought precision.
**And note where the revelation came from.** The local gate did nothing wrong; the flaw was
visible only from a machine that did not resemble the author's. That is the first argument for
running a gate somewhere else, before the one about catching regressions.
— `doctor-house: crates/doctor-probe/tests/sockets.rs`

## Before believing a tool that returns zero, run it on a case where it must return something
Empty output is well-formed whether the subject is empty or the command is looking in the wrong
place, and zero is the one value a broken instrument returns spontaneously. Corollary: **a new
check that finds nothing on its first run has not been proved yet.**
— `gaston: docs/guidelines/testing.md` §"A new check that finds nothing on its first run"

## A metric whose meaning you assume without reading what it counts is a proxy you have not identified as one
Read the code that produces the number **before writing a sentence about what it means.**
A count read as *"the label was not paired with its price"* in fact counted every
single-observation row — 0 % to 58 % across 26 real inputs, uncorrelated with the quality it
was about to gate. A threshold on it would have condemned sixteen of twenty-six good inputs,
in the document written to prevent exactly that.
— `gaston: docs/guidelines/testing.md`

## An instrument that summarises must say what it cannot summarise, rather than truncate
A summary is read as complete unless it says otherwise, so a silent truncation is a false
reading **with the authority of a measurement** — worse than no summary at all.
**The test, when writing any digest, table or top-N**: if the input outgrows the shape, does the
reader find out from the output?

## A rig that reconstructs the code cannot measure it — decide which, before writing it
The harness that **imported the module** was right on the first run; the probe that **asked the
OS at runtime** closed three questions in one build; five hand-written rigs that rebuilt the
same layout from memory all came up mute, each asserting something about code it never read.
That is a false claim committed *inside an instrument*, which is worse than in a comment: a
false comment is read, **a false rig returns a result.**
**The tell, before writing**: does it import the module, query the OS or the browser at runtime,
mount the real thing — or does it restate them? A reconstruction may explore something that
does not exist yet; it never concludes about code that does.
— `gaston: docs/guidelines/testing.md` §« Une mire lit la source, ou une reconstruction »

## A property derived from another is not measured
The comment asserting the equivalence is what stops you seeing it. Ask the question you
actually have, not one you can compute from something nearby.
— `gaston: docs/guidelines/testing.md` §« une propriété dérivée »

## A valid experiment can be read as answering a question it does not ask
The experiment was sound; the sentence written under it was about something else. Write down
what each outcome would eliminate **before** running it.
— `gaston: docs/guidelines/testing.md`
