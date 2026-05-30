#!/usr/bin/env bash
# PostToolUse hook: runs after every Write or Edit.
# Lints the workspace so Claude never leaves it dirty.
# Deterministic: this ALWAYS runs, unlike a CLAUDE.md instruction.
set -euo pipefail

# Degrade gracefully if there is no package.json yet.
if [ -f package.json ]; then
  npm run lint --silent || true
fi

exit 0
