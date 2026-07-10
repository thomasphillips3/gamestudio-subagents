<#
  Install the Game Studio subagents into your user-level Claude Code workspace
  (%USERPROFILE%\.claude\agents). Each agent already carries the YAML frontmatter
  Claude Code needs, so a plain copy is all it takes.

  Usage:
    ./install.ps1              # install to ~/.claude/agents
    ./install.ps1 -Project     # install into ./.claude/agents (project scope)
#>
param(
  [switch]$Project
)
$ErrorActionPreference = "Stop"

$src = Join-Path $PSScriptRoot "agents"

if ($Project) {
  $dest = Join-Path (Get-Location) ".claude/agents"
  $scope = "project (.claude/agents)"
} else {
  $dest = Join-Path $HOME ".claude/agents"
  $scope = "user (~/.claude/agents)"
}

New-Item -ItemType Directory -Force -Path $dest | Out-Null

$count = 0
Get-ChildItem -Path $src -Filter *.md | Where-Object { $_.Name -ne "README.md" } | ForEach-Object {
  Copy-Item $_.FullName -Destination (Join-Path $dest $_.Name) -Force
  $count++
}

Write-Host "Installed $count Game Studio subagents to: $dest  [$scope]"
Write-Host "Restart Claude Code so it picks up the new agents."
Write-Host 'Then try:  "Use the gamestudio-orchestrator agent to start a new game project."'
