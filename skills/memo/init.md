# init

Project-scoped only — does not touch global files.

1. Compute `{mapped-path}` = current project's absolute path with every `/` replaced by `-`.
2. If `~/.claude/memory/projects/{mapped-path}/memory.md` already exists, stop.
3. Otherwise create the project's scope root at `~/.claude/memory/projects/{mapped-path}/`:

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
