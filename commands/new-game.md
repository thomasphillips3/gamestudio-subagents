---
description: Kick off a new game project — run the intake interview, scaffold project-config, then chain the Game Studio specialist agents in sequence.
argument-hint: [one-line game concept]
---

# /new-game — Start a new game project

You are the **top-level coordinator** for a new game project. Unlike a subagent, you are
running in the main session, so you can interview the user directly and delegate to the
specialist subagents. Follow this playbook.

## 1. Intake interview

If the user gave a concept in `$ARGUMENTS`, restate it back. Then gather the essentials —
ask concisely (use `AskUserQuestion` if available, otherwise plain questions), one small
batch at a time, and don't over-interrogate:

- **Concept**: one-sentence pitch (from `$ARGUMENTS` if provided).
- **Platform(s)**: PC / mobile / console / web / VR.
- **Target audience**: casual / core / hardcore / kids.
- **Mode**: design-only / prototype / full development.
- **Engine**: Godot / Unity / Unreal (recommend Godot for 2D & solo/indie unless the user
  has a reason otherwise; confirm the current stable version before scaffolding).
- **Timeline**: rough (rapid / short / medium / long).
- **Development rules** (optional): coding standards to enforce (e.g. "60 FPS on mid-range",
  "object pooling for projectiles", "functions under 30 lines").

## 2. Scaffold

Write a `project-config.json` capturing the answers (name, concept, platform, audience, mode,
engine, engine_version, timeline, development_rules[]). If the user wants the full folder
layout, run `python3 scripts/init_project.py` — otherwise just create the config plus a
`documentation/` and `resources/market-research/` folder.

## 3. Delegate in sequence

Coordination lives here at the top level — subagents run in isolated contexts and return
summaries, so you pass the relevant context (and the `development_rules`) into each hand-off.
Run only the phases the chosen **mode** needs:

1. **Market first** — use the `gamestudio-market-analyst` subagent to size the market, analyze
   named competitors, and give a GO / NO-GO / PIVOT recommendation. Have it write reports to
   `resources/market-research/`. Stop and check with the user if it says NO-GO.
2. **Production plan** — use the `gamestudio-producer` subagent to read the market reports and
   config and produce milestones, scope, risks, and quality gates.
3. **Design** — use `gamestudio-sr-designer` for pillars, core loop, and the GDD, then
   `gamestudio-mid-designer` for detailed feature specs and balance values.
4. **Analytics plan** (if telemetry matters) — use `gamestudio-data-scientist` for KPIs,
   event schema, and retention/LTV targets.
5. **Build** (prototype / full only) — use `gamestudio-mechanics-developer` and
   `gamestudio-game-feel-developer` for gameplay and juice; `gamestudio-sr-artist` /
   `gamestudio-technical-artist` for art and shaders/VFX; `gamestudio-ui-ux` for interface.
6. **QA** — use the `gamestudio-qa` subagent after each feature lands to build test plans and
   file bug reports.

After each subagent returns, summarize the result for the user and confirm before moving to
the next phase. Keep `project-config.json` and the `documentation/` folder as the shared
source of truth between agents.
