# Claude Code Starter

A clean, copy-paste `.claude/` setup for [Claude Code](https://claude.com/claude-code).
Drop it into any project (new or existing) and you get a sensible, modern Claude
Code configuration with every surface set up as a working example: **CLAUDE.md,
hooks, skills, agents, rules, plugins, output styles, and settings.**

Everything here is generic and safe to use as a template. Replace the
placeholders with your own project's details.

## Quick start

**New project:**
```bash
git clone https://github.com/manthanpatelll/claude-code-starter.git my-app
cd my-app
rm -rf .git && git init
# open in Claude Code and start building
```

**Existing project:** copy the `.claude/` folder, `CLAUDE.md`, `.mcp.json`, and
`.gitignore` lines into your repo's root:
```bash
cp -r claude-code-starter/.claude your-project/.claude
cp claude-code-starter/CLAUDE.md your-project/CLAUDE.md
cp claude-code-starter/.mcp.json your-project/.mcp.json
```

Then make the hooks executable:
```bash
chmod +x .claude/hooks/*.sh
```

## What's inside

```
your-project/
├── CLAUDE.md              # project rules, loaded every session (keep it lean)
├── CLAUDE.local.md        # personal notes, gitignored
├── .mcp.json              # MCP server connections (MUST be at repo root)
├── .gitignore
└── .claude/
    ├── settings.json      # the control panel: model, permissions, hook registry
    ├── settings.local.json.example   # copy to settings.local.json for personal overrides
    ├── hooks/             # scripts that run automatically at set moments
    │   ├── session-start.sh      # injects project context when a session opens
    │   ├── post-edit-format.sh   # lints automatically after every edit
    │   └── pre-deploy-guard.sh   # runs tests before a deploy, blocks if broken
    ├── commands/          # legacy slash commands (still supported)
    │   └── ship.md
    ├── skills/            # reusable workflows you trigger with /
    │   ├── code-review/
    │   ├── e2e/
    │   └── api-health/
    ├── agents/            # subagents with their own context window
    │   ├── code-reviewer.md
    │   ├── researcher.md
    │   └── log-analyzer.md
    ├── output-styles/     # how Claude formats its replies
    │   └── terse.md
    ├── rules/             # path-scoped rules that load only when relevant
    │   └── api.md
    └── plugins/           # bundled, installable packages (namespaced commands)
        └── deploy/
```

## The mental model

| Layer | Where | What it does |
|-------|-------|--------------|
| **Rules** | `CLAUDE.md` + `rules/` | what Claude should always know |
| **Tools** | `.mcp.json` | live connections (browser, database, etc.) |
| **Skills** | `.claude/skills/` | reusable workflows you invoke with `/` |
| **Hooks** | `.claude/hooks/` | automation that ALWAYS fires (registered in settings.json) |
| **Agents** | `.claude/agents/` | isolated workers for side tasks |
| **Plugins** | `.claude/plugins/` | bundles of the above, installable from a marketplace |
| **Settings** | `settings.json` | the control panel that wires it all together |

**Key insight:** `CLAUDE.md` is advisory (Claude might forget). **Hooks are
deterministic** (they always run). Use hooks for anything that MUST happen, like
auto-formatting or blocking a broken deploy.

## The three hooks explained

- **`session-start.sh`** runs the moment you open Claude Code and tells it your
  branch, last commit, and rules, so it starts oriented.
- **`post-edit-format.sh`** runs after every file edit and lints automatically,
  so Claude never leaves messy code.
- **`pre-deploy-guard.sh`** runs before a deploy command, runs your tests first,
  and blocks the deploy if anything is failing. Broken code can't ship by accident.

Hooks only fire once they are **registered in `settings.json`** (see the `hooks`
block). The script files are the *what*; settings.json is the *when*.

## Customize it

1. Edit `CLAUDE.md` with your project's real description, tech stack, and rules.
2. Edit `.mcp.json` with your real MCP servers.
3. Edit `pre-deploy-guard.sh` so the grep matches your deploy command.
4. Add your own skills under `.claude/skills/<name>/SKILL.md`.

## License

MIT. Use it however you like.
