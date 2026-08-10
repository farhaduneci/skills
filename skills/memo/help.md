# help

Print this reference verbatim (don't read any other subcommand file first):

```
/memo <subcommand> [args]

Subcommands:
  help                Show this message.

  init                Create the current project's memory scope (memory.md + general.md
                      under projects/{mapped-path}/). No-ops if it already exists. Doesn't
                      touch global files.

  reorganize [scope]  Dedupe, merge, re-sort, and split memory files.
                      - default scope: global only (memory.md, general.md, domain/)
                      - scoped, e.g. `/memo reorganize projects/linkedin`, to include a
                        project's scope instead

  recall [topic]      Load relevant memory into context.
                      - no topic: skim both the project's and global memory.md indexes,
                        pull in whatever files look relevant to the current task
                      - with topic: read that file directly (matches an index table or
                        filename), checking the project's index first, then global

  update [text]       Persist a fact to memory.
                      - with text: save it as a new entry
                      - without text: infer what's worth saving from the conversation so far
                      Routes to project or global scope depending on whether the fact is
                      project-specific, then to general.md or domain/{topic}.md within that
                      scope. Auto-runs `init` first if this project has no memory scope yet.

No argument → defaults to `recall`.

Memory lives in ~/.claude/memory/, in two scopes with the identical shape:
  memory.md                 index (table of file/description/last-updated)
  general.md                catch-all, cross-topic facts
  domain/{topic}.md         facts about one nameable subject (tool, skill, library, service)

  global scope:   ~/.claude/memory/{memory.md,general.md,domain/}
  project scope:  ~/.claude/memory/projects/{mapped-path}/{memory.md,general.md,domain/}
                  (mapped-path = project's absolute path, / -> -)

Claude can also invoke this proactively — "remember X" / "note that X" implies `update`,
"what do we know about X" implies `recall` — not just via explicit /memo calls.
```
