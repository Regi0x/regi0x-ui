---
paths:
  - "infra/**/*"
  - "deploy/**/*"
  - "ops/**/*"
  - "**/*.service"
  - "**/*.socket"
  - "**/*.timer"
  - "**/*.container"
  - "**/*.network"
  - "**/*.volume"
  - "Taskfile*.yml"
  - "Taskfile*.yaml"
---
# Runtime and deployment

- Native Linux binaries managed by systemd are the default deployment model.
- Do not introduce Docker, Dockerfiles, Docker Compose, Docker Desktop assumptions, or Docker-based development workflows unless explicitly requested.
- Do not containerize by default. Before adding a container, identify the concrete isolation/packaging problem it solves better than a native systemd service.
- When a container is justified, prefer Podman and systemd Quadlet over Docker-compatible Compose workflows.
- Python is not part of the application/runtime/tooling stack by default. Do not add Python services, utility scripts, virtualenvs, pip/poetry/uv workflows, or Python build steps for convenience.
- Prefer Taskfile, Go tooling, Rust tooling where relevant, and small Bash/POSIX shell scripts for project automation.
- A third-party system package may internally depend on Python; do not reject sound OS tooling merely because of an implementation dependency.
- Production services must have explicit users/groups, least-privilege filesystem access, restart policy, resource expectations, logs, health behavior, graceful shutdown and rollback instructions.
- Do not expose internal daemons on `0.0.0.0` merely for convenience.
