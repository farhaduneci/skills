---
name: memo
description: Manage the ~/.claude/memory/ system — recall relevant memory, persist new facts, initialize a project's memory file, or reorganize the memory tree.
argument-hint: "[update|recall|reorganize|init|help]"
---

# memo

Manages `~/.claude/memory/`: a `memory.md` index, `general.md` (cross-project facts),
`domain/{topic}.md` (domain knowledge), `tools/{tool}.md` (tool configs/CLI patterns), and
`projects/{mapped-path}/MEMORY.md` (per-project notes, one dir per absolute project path with
`/` replaced by `-`).

Invoke this either explicitly as `/memo <subcommand>`, or proactively (e.g. `recall` when a
task looks like it needs prior context, `update` when something worth remembering surfaces).

Dispatch on `$ARGUMENTS`. No argument → treat as `recall`. Read **only** the one file below
matching the subcommand, then follow it exactly — do not read the others.

| Subcommand | Instructions file |
|---|---|
| recall (default) | `recall.md` |
| update | `update.md` |
| init | `init.md` |
| reorganize | `reorganize.md` |
| help | `help.md` |

## Entry format

Every memory file is a flat list of entries, **newest first** (prepend, don't append):

```
- YYYY-MM-DD: <what> — <why>
```

Nothing more — no extra metadata, no nesting.

`memory.md` is the index: a table of `| File | Description | Last updated |`, plus this
routing/lifecycle guidance. Update the row's `Last updated` date whenever that file changes.

Soft budget: **~150 lines per file**. A file crossing that during `reorganize` is a signal to
split it or promote it (see Domain Knowledge Lifecycle in `reorganize.md`), not a hard rule.
