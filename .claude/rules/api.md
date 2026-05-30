---
paths: "app/api/**"
---

# API route rules

These load ONLY when Claude touches an API route, keeping CLAUDE.md lean.
Replace with your own API conventions.

- Every route validates auth before doing work. No anonymous writes.
- Rate-limit mutating routes.
- Verify webhook signatures before parsing the body.
- Never log request bodies that may contain personal or payment data.
