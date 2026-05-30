---
name: code-review
description: Review the current diff for bugs, security issues, and convention violations. Use when the user says "/code-review", opens a PR, or before merging.
---

# Code Review

Reviews the current branch diff and reports issues, highest priority first.

## What to check

1. Correctness bugs and unhandled edge cases.
2. Security: leaked secrets, missing auth on routes, unsafe queries.
3. Performance: obvious hot-path problems.
4. Conventions: match the rules in your CLAUDE.md (icon library, no `any`,
   formatting, naming).

## Output

A ranked list. Each item: `file:line`, severity, one-line fix. Do not paste the
whole diff back. Summary only.
