# init

Project-scoped only — does not touch global files.

1. If `~/.claude/memory/projects/{mapped-path}/memory.md` already exists (see SKILL.md for
   how `{mapped-path}` is derived), stop.
2. Otherwise create the project's scope root at `~/.claude/memory/projects/{mapped-path}/`:

`general.md`:
```
# {Project Name} - General

(Populated as you work in this project)
```

`memory.md`:
```
# {Project Name} - Memory Index

| File | Description | Last updated |
|------|-------------|--------------|
| `general.md` | Cross-topic project notes | {today's date} |
```

Don't create a `domain/` dir upfront — `domain/{topic}.md` files get created by `update` only
when a fact clusters around a nameable subject (see `update.md`).
