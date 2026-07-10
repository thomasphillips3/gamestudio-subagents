# Installing the Game Studio Subagents

These 12 agents are **native Claude Code subagents** — each file in [`agents/`](agents/)
carries the YAML frontmatter (`name`, `description`, `tools`, `model`) that Claude Code
requires to register and auto-delegate to a subagent. Pick whichever install path suits you.

## Option A — Claude Code plugin (recommended)

This repo doubles as a single-plugin marketplace, so you can install everything with two
slash commands inside Claude Code:

```
/plugin marketplace add thomasphillips3/gamestudio-subagents
/plugin install gamestudio-subagents@gamestudio
```

Benefits: versioned updates (`/plugin marketplace update`), clean enable/disable/uninstall,
namespaced agents (`gamestudio-subagents:gamestudio-orchestrator`), and it works in both
Claude Code and Cowork. To develop or test locally without the marketplace:

```
claude --plugin-dir /path/to/gamestudio-subagents
```

## Option B — copy into your agents folder (no plugin system)

```bash
git clone https://github.com/thomasphillips3/gamestudio-subagents.git
cd gamestudio-subagents
./install.sh            # user scope  -> ~/.claude/agents/
PROJECT=1 ./install.sh  # project scope -> ./.claude/agents/
```

Windows (PowerShell): `./install.ps1` (add `-Project` for project scope).

Restart Claude Code afterward so it picks up the new agents.

## Verifying

Open Claude Code and run `/agents` — you should see the `gamestudio-*` agents listed.
Then try:

```
Use the gamestudio-orchestrator agent to start a new game project.
```

Or let automatic delegation kick in, e.g. *"Analyze the market for a cozy farming roguelike"*
should route to `gamestudio-market-analyst`.

## The 12 agents

| Agent (`name`) | Role |
| --- | --- |
| `gamestudio-orchestrator` | Coordinator / project kickoff |
| `gamestudio-producer` | Production management, milestones, quality gates |
| `gamestudio-market-analyst` | Market sizing, competitor analysis, GO/NO-GO |
| `gamestudio-data-scientist` | Telemetry, KPIs, retention/LTV, A/B tests |
| `gamestudio-sr-designer` | Vision, core loop, GDD authority |
| `gamestudio-mid-designer` | Feature specs, content, balance/tuning |
| `gamestudio-mechanics-developer` | Core gameplay systems engineering |
| `gamestudio-game-feel-developer` | Juice: screen shake, coyote time, hitstop |
| `gamestudio-sr-artist` | Art direction, style guide, pipeline |
| `gamestudio-technical-artist` | Shaders, VFX, optimization |
| `gamestudio-ui-ux` | Interface flows, HUD, accessibility |
| `gamestudio-qa` | Test plans, bug reports, regression |

## A note on orchestration

In Claude Code a subagent runs in an isolated context and cannot interactively prompt you
or spawn other subagents. The `gamestudio-orchestrator` therefore works best as a **playbook
the main session follows** — it plans the project and the main thread delegates to each
specialist in sequence — rather than a runtime that "activates" the others. See
[`docs/AUDIT-2026-07.md`](docs/AUDIT-2026-07.md) for the full rationale.
