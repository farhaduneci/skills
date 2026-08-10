# update [text]

- With `text`: persist it as a new entry.
- Without `text`: infer from the conversation so far what's worth persisting.

If the current project has no memory scope yet (no `projects/{mapped-path}/memory.md`), run
`init` first (see `init.md`).

Route each fact in two steps:

1. **Scope** — true only for the current project → project scope
   (`~/.claude/memory/projects/{mapped-path}/`). True more broadly → global scope
   (`~/.claude/memory/`).
2. **File within that scope** — clusters around a nameable subject → that scope's
   `domain/{topic}.md`, created immediately even for a single entry. Otherwise → that scope's
   `general.md`.

Create the target file if it doesn't exist, prepend the entry (newest first, see Entry format
in `SKILL.md`), and update its row in that scope's `memory.md` index (creating the row if new).
