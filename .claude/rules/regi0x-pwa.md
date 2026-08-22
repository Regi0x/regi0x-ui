---
paths:
  - "**/manifest.webmanifest"
  - "**/*service-worker*.*"
  - "**/sw.*"
  - "apps/**/*pwa*"
  - "web/**/*pwa*"
---
# PWA policy

PWA is an optional installable shell for appropriate web panels, not a replacement for authoritative server state.

- Each origin/installable application owns its manifest/start URL and service-worker scope.
- Cache static application shell/assets deliberately; version caches and cap retention.
- Do not cache privileged mutations, authorization decisions, TTS queue state, Minecraft server state or other operational data as authoritative offline truth.
- When offline, show an explicit offline/degraded state and disable unsafe control actions.
- Do not let service-worker update checks block initial rendering.
- PWA permissions/push/background behavior must be opt-in and justified by a product requirement.
- A future Tauri launcher remains a desktop app; do not force launcher responsibilities into PWA.
