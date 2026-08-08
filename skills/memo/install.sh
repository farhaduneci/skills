#!/usr/bin/env bash
# Symlinks this skill into ~/.claude/skills/.
set -euo pipefail

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL="$(basename "$SKILL_DIR")"
TARGET_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
LINK="$TARGET_DIR/$SKILL"

mkdir -p "$TARGET_DIR"

if [ -L "$LINK" ] && [ "$(readlink "$LINK")" = "$SKILL_DIR" ]; then
  echo "up to date: $SKILL"
elif [ -L "$LINK" ] && [ ! -e "$LINK" ]; then
  # Dangling symlink, e.g. left over from a repo move — safe to replace.
  ln -sf "$SKILL_DIR" "$LINK"
  echo "relinked: $SKILL"
elif [ -e "$LINK" ]; then
  echo "skip: $LINK already exists and isn't linked to this repo" >&2
else
  ln -s "$SKILL_DIR" "$LINK"
  echo "linked: $SKILL"
fi
