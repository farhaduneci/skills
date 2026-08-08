# help

Print this reference verbatim (don't read any other subcommand file first):

```
/memo <subcommand> [args]

Subcommands:
  recall [topic]     Load relevant memory into context.
                      - no topic: skim memory.md's index, pull in whatever files look relevant
                        to the current task
                      - with topic: read that file directly (matches index table or filename)

  update [text]       Persist a fact to memory.
                      - with text: save it as a new entry
                      - without text: infer what's worth saving from the conversation so far
                      Auto-runs `init` first if this project has no MEMORY.md yet.

  init                Create ~/.claude/memory/projects/{mapped-path}/MEMORY.md for the current
                      project. No-ops if it already exists. Doesn't touch global files.

  reorganize [scope]  Dedupe, merge, re-sort, and split memory files.
                      - default scope: global only (memory.md, general.md, domain/, tools/)
                      - scoped, e.g. `/memo reorganize projects/linkedin`, to include a project's
                        MEMORY.md

  help                Show this message.

No argument → defaults to `recall`.

Memory lives in ~/.claude/memory/:
  memory.md                          index (table of file/description/last-updated)
  general.md                         cross-project facts
  domain/{topic}.md                  domain knowledge
  tools/{tool}.md                    tool configs/CLI patterns
  projects/{mapped-path}/MEMORY.md   per-project notes (abs path, / -> -)

Claude can also invoke this proactively (recall when context looks relevant, update when
something worth remembering surfaces) — not just via explicit /memo calls.
```
