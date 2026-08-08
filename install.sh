#!/usr/bin/env bash
# Runs every skill's own install.sh.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for installer in "$REPO_DIR"/skills/*/install.sh; do
  [ -f "$installer" ] || continue
  "$installer"
done
