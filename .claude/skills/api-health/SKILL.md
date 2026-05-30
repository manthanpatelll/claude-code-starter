---
name: api-health
description: Check the health of your backend routes and third-party services. Use when the user says "/api-health", reports something broken in production, or before/after a deploy.
---

# API Health

Pings your critical services and routes so you catch an outage before a user
does. Replace the checks below with your real services.

## Workflow

1. Hit each health surface and record status + latency:
   - Your auth endpoint responds.
   - Your database answers a trivial query.
   - Your payment / email / storage providers are reachable.
2. Confirm critical env vars are set correctly for the current environment.
3. Report a green/red table. On any red, give the dashboard link to investigate.
