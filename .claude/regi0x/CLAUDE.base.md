# Regi0x engineering contract

This is the short, always-on execution contract for Regi0x-family repositories. Keep it concise. Product-specific architecture belongs in the selected project profile; deep procedures belong in skills; file-specific guidance belongs in path-scoped rules.

## Source of truth

When sources conflict, use this order:
1. The repository's pinned dependency versions and lockfiles.
2. The selected project profile and approved architecture/security rules in `.claude/rules/`.
3. `docs/design-system/REGI0X_DESIGN_SYSTEM_v3.md` and its tokens for UI work.
4. Stable production components and tests.
5. Mockups/screenshots/legacy code.

Never silently invent a permanent exception. If the system lacks a rule, state the gap.

## Architecture

Regi0x-family web applications are server-first unless a selected project profile says otherwise for a dedicated desktop client.

- Go owns domain logic, services, HTTP handlers, auth and server-side validation.
- templ owns server-rendered HTML and reusable server UI.
- htmx is the default browser interaction layer for server-driven UI.
- Tailwind implements styling using Regi0x semantic/component tokens.
- Chart.js is the default for ordinary 2D charts.
- Three.js/WebGPU is for 3D, ambient and specialist visual scenes only.
- Svelte is allowed only as an isolated web island when complex local browser state materially justifies it. A future Tauri desktop app may use Svelte as its primary UI layer under its profile rules.
- Taskfile is the canonical developer interface when a task exists.
- Caddy owns TLS, reverse proxying and static delivery; business logic stays in the application.

Do not introduce another framework when an existing layer solves the problem cleanly.

## Runtime policy

- Native binaries + systemd are the default production model.
- Docker/Docker Compose are not part of the normal stack. Do not add them unless explicitly requested.
- Use Podman only when container isolation/packaging has a concrete benefit; prefer systemd Quadlet integration.
- Python is not part of the normal application/tooling stack. Do not add Python services or convenience scripts when Go, Rust, Taskfile or small shell tooling is sufficient.
- Do not add Kubernetes or microservices merely to imitate a larger infrastructure.

## UI decision order

Choose the least complex layer that correctly solves the task:

1. HTML + templ
2. htmx
3. small vanilla TypeScript/JavaScript
4. Svelte island

For visualisation:

1. HTML/CSS
2. Chart.js
3. Three.js/WebGPU

Use GSAP only when CSS/Three animation is insufficient for deliberate timeline/scroll choreography. Do not add Alpine.js to projects that use the Svelte-island policy.

## Dependency policy

- Installed/pinned project versions are authoritative.
- Read `go.mod`, `go.sum`, `package.json` and lockfiles before version-sensitive work.
- Never assume "latest" equals "installed".
- Never upgrade a dependency unless the task explicitly requests an upgrade.
- For unfamiliar or version-sensitive APIs, verify against official upstream documentation for the installed version.
- Official upstream docs and migration guides override third-party skills.
- Never guess an API. Verify it if confidence is low.

Use `/stack-context` before version-sensitive implementation and `/dependency-audit` for upgrades.

## Change discipline

- Preserve established architecture, public contracts and canonical UI unless the task explicitly requires changing them.
- Before implementation, inspect the closest existing feature/component/pattern and the repository manifests.
- Do not add a dependency, abstraction, service or framework merely as a cleanup or “improvement”; state the concrete problem it solves first.
- Separate proposed architectural changes from requested implementation. Do not silently redesign the system while completing a feature.
- For user-facing work, EN/RU, responsive layout, accessibility, loading/error/empty states and reduced-motion behavior are acceptance criteria, not optional polish.
- Prefer a small coherent change that passes the repository checks over a broad speculative refactor.

## Engineering rules

- Correctness and security beat cleverness.
- Prefer standard library and simple dependencies when equally correct.
- Do not create abstractions without a demonstrated need.
- Avoid `Manager`, `UniversalService`, `Helper`, `Util` and similar dumping grounds.
- Keep HTTP handlers thin; domain behavior belongs outside transport code.
- Validate untrusted input server-side. Never trust browser-provided identity, role or authorization state.
- Do not log secrets, tokens, credentials or private values.
- Use SSE by default for one-way realtime updates; use WebSocket only for genuine bidirectional requirements.
- Production services need graceful shutdown, health/readiness, structured logs and a rollback path.
- Feature-Sliced Design principles may guide cohesion/boundaries, but do not force frontend layer names onto idiomatic Go packages.
- Public/browser/desktop APIs default to HTTP + JSON/OpenAPI. Protobuf/gRPC requires a concrete need; never use network RPC to split packages inside one process.

## UI and design-system rules

For UI work, read the relevant section of `docs/design-system/REGI0X_DESIGN_SYSTEM_v3.md` on demand.

- Search for an existing component before creating a new one.
- Use semantic/component tokens; do not add one-off colors, radii, shadows, spacing, z-index or motion values.
- Implement dark and light themes together unless a selected product surface explicitly has a narrower theme contract.
- Preserve visible `focus-visible`, keyboard behavior, 44x44 touch targets, reduced-motion behavior and realistic EN/RU localization.
- Use native HTML semantics first; ARIA supplements semantics.
- Streamer Mode is visual privacy, not a security boundary.
- Missing data is not zero.

## Commands and validation

Prefer `task <name>` over reconstructing command sequences when the repository defines the task.

Before calling a change complete:
- run the narrowest relevant tests/checks first;
- then run the repository's canonical verification task if available (`task check`, `task test`, or equivalent);
- report checks that could not be run and why.

Do not claim a command passed unless it was actually executed successfully.

## Context discipline

- Do not load the full design system, product blueprint or large third-party references unless the task needs them.
- Prefer path-scoped rules for file-specific guidance.
- Prefer skills for repeatable multi-step workflows.
- Delegate large research/audit tasks to subagents and return only actionable summaries.
- Do not install/load future technology skills (for example Rust/Tauri) into a repo until that technology actually exists there.
- After long research or multiple skills, use `/compact` when the main context becomes noisy.

## Humanizer

Write code like an experienced engineer: domain names, comments that explain why, useful errors, intentional UI hierarchy, no fake metrics, no meaningless gradient/card spam, and no generic "AI startup" copy.
