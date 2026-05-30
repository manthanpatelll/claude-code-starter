---
name: e2e
description: Run and fix end-to-end tests. Use when the user says "/e2e", a test is flaking, a CI run failed, or after a change to a user-facing flow. Never changes app logic without a spec backing it.
---

# E2E

Runs the test suite, triages failures, and fixes flake without quietly changing
product behaviour.

## Workflow

1. Run the suite (e.g. `npx playwright test`). Scope to a flow if one is given.
2. For each failure, decide the category before touching anything:
   - Real bug -> report it, do not "fix" the test to pass.
   - Outdated test (spec changed on purpose) -> update the test.
   - Flake (timing/race) -> stabilize with proper waits, not sleeps.
3. Re-run a fixed test a few times to confirm it is no longer flaky.

## Hard rule

Never weaken an assertion just to make CI green. A flaky pass is worse than an
honest fail.
