#!/usr/bin/env bash
# SessionStart hook: fires once when a Claude Code session begins.
# Injects live project context so Claude starts already oriented.
set -euo pipefail

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")
  LAST=$(git log -1 --pretty=format:'%s' 2>/dev/null || echo "no commits yet")
else
  BRANCH="(not a git repo)"
  LAST="n/a"
fi

BANNER="Session loaded | Branch: ${BRANCH} | Last commit: ${LAST} | Rule: never push to main without asking."

cat <<EOF
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "${BANNER}"
  },
  "systemMessage": "${BANNER}"
}
EOF

exit 0
