# recall [topic]

Checks both scopes, project first: `~/.claude/memory/projects/{mapped-path}/` (if it exists),
then `~/.claude/memory/` (global).

- No `topic`: for each scope in order, read that scope's `memory.md` index table, judge from
  the current task which files (`general.md`, `domain/*.md`) are relevant, and read those.
- With `topic`: for each scope in order, check its `memory.md` index table / filenames for a
  match; read the first match found. If both scopes have a matching file, read both.
