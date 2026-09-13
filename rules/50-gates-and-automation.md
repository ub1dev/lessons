# Gates, tools and automation

## A tool asked to stop early answers a different question
`cargo clippy --keep-going`, `cargo test --no-fail-fast`: **the flags are not optional.**
Without them the run that reports "3 failed" has not looked at the rest, and a count taken from
it is a claim about a partial state. Fixing three and re-running is how a fourth stays hidden
for an afternoon.

## A pipe replaces the exit code with the last command's — and `head` also kills the run
`cmd | tail -3` exits with `tail`'s status. A run with two compilation errors once printed
"FMT OK" and reported zero failures. Redirect to a file and read the command's own exit code;
in a script, `set -o pipefail`.

**The second face is worse, because the run does not finish.** `gate.sh | grep … | head -40`
gave `head` its forty lines at the TEST stage; `head` exited, the gate took `SIGPIPE` and died
four minutes in. The output ends mid-run and reads exactly like a run that finished — the same
stage lines, no error, nothing saying *cut*. The tell was arithmetic and nearly missed: `time`
printed 4:47 for the pipeline and 3:25 for `head`. **Never put `head` on a long-running
producer**; the same redirect fixes both faces at once.

**The third face is the idiom that reports nothing.** `${PIPESTATUS[0]}` is bash; under zsh it
expands to empty, so the line prints `exit=` and a shell that never ran the check looks like a
check that passed. zsh spells it `${pipestatus[1]}` — one-based, different name. **Capture into
a variable and read `$?` on the next line**, which is the same in both shells and needs no
memory of which one is running.

## A `pgrep -f` guard matches its own command line
`until ! pgrep -f "cargo test"; do sleep 10; done` never exits — the waiting shell's own
arguments contain the string, so it finds itself and waits for ever. It looks exactly like a
long-running job; three such waiters were once left spinning, one for two days, and the gate
they were queued behind never started. Use `pgrep -x`, the bracket trick (`"[c]argo test"`),
or a marker file.

**These three are one family**: a tool answering a question about itself, or about part of
itself, without anyone writing a false sentence.

## A check's green is about its scope, and its scope is smaller than its name
Paid twice in two days, in both available shapes, and neither reading was a lie.

**Between tools**: `cargo deny` green while the forge counted nineteen alerts. `cargo deny`
reads `Cargo.lock` and stops there — **nothing in the gate read `pnpm-lock.yaml`**, and
eighteen of the nineteen were npm. A whole dependency policy, written and enforced, over one
of the two lockfiles in the repository.

**Inside one tool**: the remaining one was Rust, and the same green covered it too. The
advisory class `unsound` sat at its default `none` because the ADR had named `vulnerability`
and `unmaintained` and not the third class. The knob was not turned off by anyone; it was
never named, which is quieter.

**The operative move, before quoting a green against somebody else's count**: enumerate what
the check *reads* and which classes it is *configured to act on*. A tool named after a whole
subject answers about the file it opens. And when two counters disagree, the first question is
what each one reads — not which is wrong, because usually neither is.

**Corollary on the forge's number**: it is a snapshot of the last push it scanned. Before
treating it as a disagreement, compare each alert's patched version against the lockfile you
just pushed — the two readings that agreed on one alert out of twenty were the ranges and the
lockfile, not the two dashboards.
— `gaston: scripts/audit-npm.sh`
— `gaston: deny.toml`

## A git command's reach is the one it names, not the one you had in mind
Paid on two different commands, in two repositories, and neither ever misbehaved.

**`git checkout -- <file>` restores to what exists — and what exists is not your afternoon.**
Three times, undoing a deliberate sabotage also undid the uncommitted work sitting in the same
file, whose only copy was the diff in the terminal. The third time was inside the commit adding
a guard against forgetting things.

**`git add <directory>` stages what the directory holds — and what it holds is not what you
wrote.** Twice in one session a file nobody was supposed to commit rode into an unrelated commit
that way; the second reached the remote. Both times the file was never named, only contained.

**The test, before any git command that takes a path**: *what else is under that path?* It is
not a question about the command — the command is documented and correct — it is a question
about the difference between the set you named and the set you meant.

**Two remedies, and the second is the one that lasts.** Commit before you sabotage, and name
files instead of directories: those are habits, and a habit that has failed twice will fail a
third time. Where one file must never be committed, the control is a **refusal at commit time**
— not a warning, because a control that only prints is a control people learn to scroll past.
And a refusal is bypassable by design (`--no-verify`), which is the whole of what it buys:
the mistake becomes deliberate instead of distracted.
— `doctor-house: scripts/check-adr-index.sh`
— `gaston: scripts/hooks/pre-commit`
— `gaston: docs/DEBT.md` §DEBT-009

## A gate that runs while the tree is being edited measures nothing
Its green reports a snapshot it does not name. One gate at a time, nothing written while it
runs, and check that no source file is newer than the log before reading it.
— `gaston: docs/guidelines/testing.md` §« la porte tournait, mais l'arbre bougeait sous elle »

## The gate is the last thing before the commit, or it is a different commit's gate
— `gaston: docs/guidelines/engineering-standards.md`

## An automation artefact must name where it runs, and someone must have seen it run
A CI workflow sat in a repository for twelve days — two jobs, correct caching, the right flags —
with **no remote for it to run on.** It never executed once. It is the worst form of the
"instrument at its input" failure, because the half that worked was the *verification itself*:
the local gate was green, so nothing asked. And a config file you can open and understand does
not merely fail to alert, **it reassures.**
**The operative check is one second long and binary**: *has anyone seen a run?*

**Corollary, found the same day**: whatever verifies the repository belongs **in** the
repository. The one script that ran all six stages lived in a session scratch directory,
unversioned, hard-coding its author's home path. A control that lives beside the repo does not
survive the session, is never re-read, and appears in no audit — including the ones looking for it.

**The variant that is worse, because it looks like the opposite.** The same workflow, once it
did have a remote, later ran nothing for nine days — a billing failure on the account meant no
job ever *started*.
What made it survive nine days is that the run list was neither empty nor absent: it was **full
of crosses**, fifty of them, each carrying a real commit title and a three-second duration.
**A list of failures reads as work.** A red is the one state nobody audits, because a red is
already the thing you were watching for; and "the CI is red again" is a sentence that gets said
about a repository for weeks without anyone opening a run.
**So the one-second check is not *is there a run* and not *is it green* — it is *did a job
start*.** Empty, absent, and never-started are three different silences, and only the third
one decorates itself.
And its corollary for the fix: a workflow that cannot run must be **turned off**, not left to
keep manufacturing evidence of checking that never happened. Suspending it is also the only
version of the fact that survives the session.

## A repository that rewrites a developer's git config on checkout has helped itself to their machine
Hooks are opt-in, once per clone, and the opt-in is documented rather than automated.
