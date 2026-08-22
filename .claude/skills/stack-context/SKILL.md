---
name: stack-context
description: Load the actual Regi0x project tool and dependency versions before version-sensitive Go, htmx, Tailwind, Chart.js, Three.js, Svelte, Task or Caddy work.
disable-model-invocation: false
allowed-tools: Bash(bash .claude/scripts/stack-versions.sh)
---
# Project stack context

Use the repository state below as the source of truth for the current task.

```text
!`bash .claude/scripts/stack-versions.sh`
```

Rules:
1. Pinned/installed project versions beat remembered or latest upstream versions.
2. Do not upgrade anything unless the user explicitly requests an upgrade.
3. If an API is version-sensitive or unfamiliar, verify it against official upstream docs for the installed version.
4. If the output reports a missing tool, do not infer its version; inspect project configuration or report the missing local tool.
