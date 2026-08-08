# init

Project-scoped only — does not touch global files.

1. Compute `{mapped-path}` = current project's absolute path with every `/` replaced by `-`.
2. If `~/.claude/memory/projects/{mapped-path}/MEMORY.md` already exists, stop.
3. Otherwise create it:

```
# {Project Name} - Project Memory

## Global Memory

Global memory index: `~/.claude/memory/memory.md`. Use `/memo recall` to load relevant memory.

## Project Notes

(Populated as you work in this project)
```
