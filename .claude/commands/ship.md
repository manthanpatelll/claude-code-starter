---
description: Lint, build, and open a PR for the current branch. Never merges, never pushes to main.
---

Run the full pre-ship sequence:

1. `npm run lint`
2. `npm run build`
3. `npm test`
4. If all pass, push the CURRENT branch (never main) and open a PR with a
   summary of the changes. Stop there. Do not merge.

If any step fails, stop and report the failure. Do not continue to the PR.
