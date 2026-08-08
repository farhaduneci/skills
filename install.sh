#!/usr/bin/env bash
# Symlinks each skill in this repo into ~/.claude/skills/.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"

mkdir -p "$TARGET_DIR"

for skill_path in "$REPO_DIR"/*/; do
  [ -f "${skill_path}SKILL.md" ] || continue
  skill="$(basename "$skill_path")"
  link="$TARGET_DIR/$skill"

  if [ -L "$link" ] && [ "$(readlink "$link")" = "${skill_path%/}" ]; then
    echo "up to date: $skill"
  elif [ -e "$link" ]; then
    echo "skip: $link already exists and isn't linked to this repo" >&2
  else
    ln -s "${skill_path%/}" "$link"
    echo "linked: $skill"
  fi
done
