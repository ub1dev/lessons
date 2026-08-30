# Gates, tools and automation

## A tool asked to stop early answers a different question
`cargo clippy --keep-going`, `cargo test --no-fail-fast`: **the flags are not optional.**
Without them the run that reports "3 failed" has not looked at the rest, and a count taken from
it is a claim about a partial state. Fixing three and re-running is how a fourth stays hidden
for an afternoon.

## A pipe replaces the exit code with the last command's
`cmd | tail -3` exits with `tail`'s status. A run with two compilation errors once printed
"FMT OK" and reported zero failures. Redirect to a file and read the command's own exit code;
in a script, `set -o pipefail`.

## A `pgrep -f` guard matches its own command line
`until ! pgrep -f "cargo test"; do sleep 10; done` never exits — the waiting shell's own
arguments contain the string, so it finds itself and waits for ever. It looks exactly like a
long-running job; three such waiters were once left spinning, one for two days, and the gate
they were queued behind never started. Use `pgrep -x`, the bracket trick (`"[c]argo test"`),
or a marker file.

**These three are one family**: a tool answering a question about itself, or about part of
itself, without anyone writing a false sentence.

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

## A repository that rewrites a developer's git config on checkout has helped itself to their machine
Hooks are opt-in, once per clone, and the opt-in is documented rather than automated.
