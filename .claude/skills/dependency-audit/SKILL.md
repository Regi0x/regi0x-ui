---
name: dependency-audit
description: Audit or plan dependency upgrades for the Regi0x stack using pinned project versions, official upstream releases, migration guides and security notes. Use for upgrade requests, stale dependencies, compatibility checks or version-sensitive migrations.
context: fork
agent: regi0x-dependency-researcher
background: false
disable-model-invocation: false
allowed-tools: Bash(bash .claude/scripts/stack-versions.sh)
---
# Dependency audit

Target or scope: $ARGUMENTS

## Current project context

```text
!`bash .claude/scripts/stack-versions.sh`
```

Perform a read-only audit.

1. Read relevant manifests and lockfiles.
2. Identify installed/pinned versions; do not treat package constraints as installed versions when a lockfile/node_modules state says otherwise.
3. For each requested dependency, verify the latest stable release from the official upstream source.
4. Read official migration/breaking-change/security notes between installed and target versions.
5. Identify code/config files likely affected in this repository.
6. Report compatibility risks across Go, templ, htmx, Tailwind, Chart.js, Three.js/WebGPU, Svelte, Task and Caddy when relevant.
7. Recommend `upgrade now`, `upgrade with migration`, or `stay pinned`, with reasons.
8. Do not edit files or perform upgrades. Return a concise migration plan and sources checked.
