# update [text]

- With `text`: persist it as a new entry.
- Without `text`: infer from the conversation so far what's worth persisting.

Before writing, if the current project has no `~/.claude/memory/projects/{mapped-path}/MEMORY.md`
yet, run `init` first (see `init.md`).

Route each fact to one file, in this order, using judgment for anything that doesn't clearly fit:

1. Tool/CLI config, workaround, or usage pattern → `tools/{tool}.md`
2. Project-specific fact (only true for one project) → that project's `MEMORY.md` under
   `## Project Notes`
3. Topic-specific domain knowledge (spans projects but is scoped to one subject) → `domain/{topic}.md`
4. Cross-project preference/convention/environment fact → `general.md`

Create the target file if it doesn't exist, prepend the entry (newest first, see Entry format in
`SKILL.md`), and update its row in `memory.md`'s index (creating the row if new).
