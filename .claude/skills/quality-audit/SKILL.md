---
name: quality-audit
description: Run a focused production-readiness review across correctness, architecture, authorization, code quality, tests, UI/accessibility, performance and operations.
context: fork
agent: general-purpose
background: false
disable-model-invocation: true
---
# Regi0x quality audit

Audit target: $ARGUMENTS

Do not make edits. If a project profile is installed, read the short profile contract before judging architecture. Review findings ordered by severity.

Check what is relevant:
1. Correctness, cancellation/timeouts and failure handling.
2. Architectural fit: Go + templ + htmx default; justified Svelte islands; dedicated Tauri rules only when launcher exists.
3. Runtime fit: native systemd default; no accidental Docker; Podman only when justified; Python only in explicitly isolated ML adapter when genuinely required.
4. Dependency/API correctness against pinned versions.
5. Security/authorization/trust boundaries, CSRF/SSRF/upload/secret handling.
6. Human-code quality: domain names, no generic dumping-ground abstractions, comments explain why, no speculative TODOs/fake metrics/debug debris.
7. Tests and verification gaps.
8. UI states: loading/empty/error/disabled/offline/stale; EN/RU localization.
9. Keyboard/focus/touch/reduced-motion/responsive/overlay behavior.
10. Performance/resource bounds: JS/media/3D/chart cleanup, TTS queues/models, storage retention, server limits.
11. Operational concerns: graceful shutdown, health/readiness, logs/audit, systemd config, public-ingress/service boundaries and rollback.
12. Configuration: typed startup validation, structured `.env.example`, no secret leakage.

For each finding include severity, file/path, evidence, impact and smallest useful fix. End with `Checks run` and `Residual risk`.
