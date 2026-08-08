# skills

My personal Claude Code skills.

## Setup

Each skill directory is symlinked into `~/.claude/skills/` so edits here take effect immediately:

```sh
ln -s "$(pwd)/<skill>" ~/.claude/skills/<skill>
```

## Skills

- [memo](./memo) — manage `~/.claude/memory/`: recall relevant memory, persist new facts, initialize a project's memory file, or reorganize the memory tree.
