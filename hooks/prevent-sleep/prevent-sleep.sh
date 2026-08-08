#!/usr/bin/env bash
# UserPromptSubmit hook: keep the Mac awake (while on AC power) for the
# duration of this session's turn, with a safety timeout in case the
# matching Stop/SessionEnd hook never fires.
set -euo pipefail

input="$(cat)"
session_id="$(printf '%s' "$input" | jq -r '.session_id')"
pidfile="/tmp/claude_caffeinate_${session_id}.pid"

# Replace any previous assertion for this session.
if [ -f "$pidfile" ]; then
  kill "$(cat "$pidfile")" 2>/dev/null || true
fi

nohup caffeinate -s -t 10800 >/dev/null 2>&1 &
echo $! > "$pidfile"
