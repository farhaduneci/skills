# claude

My personal Claude Code setup: skills, hooks, and whatever else I end up
wiring in.

## Setup

```sh
./install.sh
```

Runs every skill's own installer, symlinking each into `~/.claude/skills/`.
Hooks aren't installed by this script — see each hook's own README.

## Skills

- [memo](./skills/memo) — manage `~/.claude/memory/`: recall relevant memory, persist new facts, initialize a project's memory file, or reorganize the memory tree.

## Hooks

- [prevent-sleep](./hooks/prevent-sleep) — keep the Mac awake on AC power while Claude Code is actively working.
