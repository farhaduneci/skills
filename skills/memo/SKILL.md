---
name: memo
description: Manage the ~/.claude/memory/ system — recall relevant memory, persist new facts, initialize a project's memory scope, or reorganize the memory tree.
argument-hint: "[help|init|reorganize|recall|update]"
---

# memo

Manages `~/.claude/memory/`, which holds two kinds of scope with the **identical shape**:

- **global** — `~/.claude/memory/{memory.md,general.md,domain/*.md}`, facts true broadly.
- **project** — `~/.claude/memory/projects/{mapped-path}/{memory.md,general.md,domain/*.md}`
  (one dir per absolute project path, `/` replaced by `-`), facts true only for that project.

Each scope root has:
- `memory.md` — index: table of `| File | Description | Last updated |`.
- `general.md` — catch-all, cross-topic facts for that scope.
- `domain/{topic}.md` — facts that cluster around one nameable subject (a tool, skill,
  library, service) within that scope.

The only difference between global and project memory is which scope a fact belongs to —
nothing else about structure, file roles, or entry format differs.

Invoke this either explicitly as `/memo <subcommand>`, or proactively — treat natural phrases
like "remember X" / "note that X" as `update`, and "what do we know about X" / "did I mention
X before" as `recall`, without waiting for the user to type `/memo`.

Dispatch on `$ARGUMENTS`. No argument → treat as `recall`. Read **only** the one file below
matching the subcommand, then follow it exactly — do not read the others.

| Subcommand | Instructions file |
|---|---|
| help | `help.md` |
| init | `init.md` |
| reorganize | `reorganize.md` |
| recall (default) | `recall.md` |
| update | `update.md` |

## Entry format

Every memory file is a flat list of entries, **newest first** (prepend, don't append):

```
- YYYY-MM-DD: <what> — <why>
```

Nothing more — no extra metadata, no nesting.

`memory.md` is the index: a table of `| File | Description | Last updated |`. Update the
row's `Last updated` date whenever that file changes.

Soft budget: **~150 lines per file**. A file crossing that during `reorganize` is a signal to
split it or promote it (see Domain Knowledge Lifecycle in `reorganize.md`), not a hard rule.
