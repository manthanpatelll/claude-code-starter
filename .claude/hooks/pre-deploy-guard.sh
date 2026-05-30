#!/usr/bin/env bash
# PreToolUse hook (matcher: Bash): a deploy quality gate.
# When Claude tries to deploy, run the tests FIRST. If anything is broken,
# block the deploy with the reason. If green, let it through.
# Deterministic: broken code can never reach production by accident.
#
# Edit the grep pattern below to match YOUR deploy command
# (vercel, netlify, fly, railway, docker push, etc).
set -euo pipefail

INPUT=$(cat)

# Only act on deploy commands. Everything else passes straight through.
if echo "$INPUT" | grep -qiE '(vercel deploy|netlify deploy|fly deploy|railway up|--prod|git push.*(prod|production))'; then
  if [ -f package.json ]; then
    if npm test >/tmp/predeploy-test.log 2>&1; then
      echo '{"decision":"allow"}'
    else
      echo '{"decision":"deny","reason":"Deploy blocked: tests are failing. Broken code must not ship. Fix the tests, then deploy."}'
    fi
  else
    echo '{"decision":"allow"}'
  fi
  exit 0
fi

echo '{"decision":"allow"}'
exit 0
