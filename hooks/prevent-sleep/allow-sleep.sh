#!/usr/bin/env bash
# Stop / SessionEnd hook: let the Mac sleep normally again once Claude is
# done or the session ends.
set -euo pipefail

input="$(cat)"
session_id="$(printf '%s' "$input" | jq -r '.session_id')"
pidfile="/tmp/claude_caffeinate_${session_id}.pid"

if [ -f "$pidfile" ]; then
  kill "$(cat "$pidfile")" 2>/dev/null || true
  rm -f "$pidfile"
fi
