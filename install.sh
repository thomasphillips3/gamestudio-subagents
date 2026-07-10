#!/usr/bin/env bash
#
# Install the Game Studio subagents into your user-level Claude Code workspace
# (~/.claude/agents/). Each agent already carries the YAML frontmatter Claude Code
# needs, so a plain copy is all it takes.
#
# Usage:
#   ./install.sh            # install to ~/.claude/agents/
#   PROJECT=1 ./install.sh  # install into ./.claude/agents/ (project scope) instead
#
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)/agents"

if [[ "${PROJECT:-0}" == "1" ]]; then
  DEST="$(pwd)/.claude/agents"
  SCOPE="project (.claude/agents)"
else
  DEST="${HOME}/.claude/agents"
  SCOPE="user (~/.claude/agents)"
fi

mkdir -p "$DEST"

count=0
for f in "$SRC"/*.md; do
  base="$(basename "$f")"
  # Skip the directory README, which is documentation, not an agent.
  [[ "$base" == "README.md" ]] && continue
  cp "$f" "$DEST/$base"
  count=$((count + 1))
done

echo "Installed $count Game Studio subagents to: $DEST  [$SCOPE]"
echo "Restart Claude Code (or reload the session) so it picks up the new agents."
echo "Then try:  \"Use the gamestudio-orchestrator agent to start a new game project.\""
