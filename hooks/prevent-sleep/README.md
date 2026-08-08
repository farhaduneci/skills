# prevent-sleep

Keeps the Mac awake (on AC power only — battery is untouched) while Claude
Code is actively working on a prompt, and lets it sleep normally again the
moment Claude stops.

Based on [tngranados.com/blog/preventing-mac-sleep-claude-code](https://tngranados.com/blog/preventing-mac-sleep-claude-code/),
adjusted to: prevent sleep on AC power only (`caffeinate -s`, not `-i`), a
3-hour safety timeout instead of 1 hour, and per-session PID files so
multiple concurrent Claude Code sessions don't kill each other's assertion.

No installer — it's two small scripts and a `settings.json` edit. Set it up
by hand:

1. Copy the scripts into `~/.claude/hooks/` and make them executable:

   ```sh
   mkdir -p ~/.claude/hooks
   cp prevent-sleep.sh allow-sleep.sh ~/.claude/hooks/
   chmod +x ~/.claude/hooks/prevent-sleep.sh ~/.claude/hooks/allow-sleep.sh
   ```

2. Add the following to the `hooks` object in `~/.claude/settings.json`
   (merge with any existing entries — don't replace the whole file):

   ```json
   {
     "hooks": {
       "UserPromptSubmit": [
         { "hooks": [{ "type": "command", "command": "$HOME/.claude/hooks/prevent-sleep.sh" }] }
       ],
       "Stop": [
         { "hooks": [{ "type": "command", "command": "$HOME/.claude/hooks/allow-sleep.sh" }] }
       ],
       "SessionEnd": [
         { "hooks": [{ "type": "command", "command": "$HOME/.claude/hooks/allow-sleep.sh" }] }
       ]
     }
   }
   ```

3. Requires `jq` (`brew install jq` if you don't have it).

## How it works

- `UserPromptSubmit` fires `prevent-sleep.sh`, which starts
  `caffeinate -s -t 10800` (AC-power-only sleep prevention, 3-hour safety
  timeout) and records its PID in `/tmp/claude_caffeinate_<session_id>.pid`.
- `Stop` fires `allow-sleep.sh`, which kills that session's caffeinate
  process.
- `SessionEnd` fires the same script as a backstop, in case `Stop` didn't
  run (e.g. the session ended some other way). Neither hook can help if the
  process is hard-killed or the lid is forced shut — the 3-hour timeout is
  the last line of defense for that.
- The display is still allowed to turn off (`-s` doesn't block display
  sleep) — only full system sleep is prevented, and only on AC power.
