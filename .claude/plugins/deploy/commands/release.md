---
description: Cut a release. Invoked as /deploy:release (plugin commands are namespaced).
---

Cut a release:

1. Confirm the branch is `main` and clean.
2. Bump the version and generate a changelog since the last tag.
3. Run the deploy command for your host (the pre-deploy guard validates tests).
4. Print the deployment URL and stop.
