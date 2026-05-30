# CLAUDE.md

This file is loaded into every Claude Code session. It is your project's
rulebook. Keep it short (under ~200 lines) and dense. Replace the placeholders
below with your own project's details.

## Project

> One-line description of what this app does.
> Domain / production URL goes here.

## Principles

1. Production-ready from day one. No placeholders, no TODOs left behind.
2. Follow the existing patterns in the codebase. Read before you write.
3. One change at a time. Show it working before moving on.

## Tech stack

- Framework: (e.g. Next.js / your framework)
- Language: (e.g. TypeScript strict)
- Styling / UI: (e.g. Tailwind + your component library)
- Backend / data: (your database + services)
- Testing: (your unit + e2e tools)

## Commands

```bash
npm run dev      # start the dev server
npm run build    # production build
npm run lint     # linter
npm test         # tests
```

## Conventions

- Icons: pick ONE icon library and stick to it.
- Dark mode and light mode must both work.
- Never commit secrets. They live in `.env.local` (gitignored).
- Commit format: `PROJ-XXX: short description`. Commit after every change.

## Rules that load on demand

Path-scoped rules live in `.claude/rules/`. They only load when Claude touches
a matching file, so this CLAUDE.md stays lean:

- `rules/api.md`  loads for `app/api/**`

## Hard rules

- IMPORTANT: never push to `main` without an explicit ask. Branch first.
- IMPORTANT: when asked to deploy, the pre-deploy guard runs your tests first
  and blocks the deploy if anything is red. Fix tests before shipping.
