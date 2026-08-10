# reorganize [scope]

Default scope = global only: `memory.md`, `general.md`, `domain/`. Project scopes are
excluded unless explicitly named, e.g. `/memo reorganize projects/linkedin`, which includes
that project's `memory.md`, `general.md`, `domain/` instead.

1. Read every file in scope.
2. Remove duplicate and outdated entries.
3. Merge entries that belong together.
4. Split files over the ~150-line budget, or that cover multiple unrelated topics.
5. Re-sort entries newest-first within each file.
6. Update `memory.md`'s index (rows + `Last updated` dates).
7. Report a summary of what changed.

No confirmation step — this is manually invoked, so act directly on edits and removals.

**Domain Knowledge Lifecycle** (apply during step 4 when a `domain/{topic}.md` file grows large
or coherent enough to stand alone):

1. Staging — knowledge accumulates in `domain/{topic}.md`.
2. Promotion — enough exists to package as a plugin/skill.
3. Pointer — after promotion, the memory file becomes a pointer to the plugin; content lives
   there. If a promoted domain needs an update, note it in the pointer file so an issue can be
   filed on the plugin repo instead of re-accumulating notes locally.
