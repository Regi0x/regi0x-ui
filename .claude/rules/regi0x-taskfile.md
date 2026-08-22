---
paths:
  - "Taskfile.yml"
  - "Taskfile.yaml"
  - "Taskfile*.yml"
  - "Taskfile*.yaml"
---
# Taskfile

- Taskfile is the canonical developer command interface when tasks exist.
- Prefer stable task names (`dev`, `build`, `fmt`, `test`, `check`) over asking contributors/agents to remember long shell pipelines.
- Tasks should be deterministic, fail on errors and be safe to rerun where reasonable.
- Keep environment-specific secrets outside Taskfile; reference environment/config instead.
- If a Task already wraps a tool command, use the Task rather than duplicating the underlying command in documentation or Claude instructions.
- Add a `stack:versions` or equivalent diagnostic task when useful, but manifests/lockfiles remain authoritative for dependency versions.
