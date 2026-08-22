---
paths:
  - "**/*.svelte"
  - "web/islands/**/*"
  - "apps/**/islands/**/*"
---
# Svelte islands

Svelte is an island technology in this architecture, not the default application shell.

- Use Svelte only when complex local browser state, rich interaction or lifecycle complexity materially exceeds htmx/vanilla JS.
- Keep server state server-owned. Do not mirror large server models into client stores without a concrete reason.
- Do not add client-side routing for pages already owned by Go/templ.
- Mount/unmount islands explicitly and clean up subscriptions, observers, timers and Three/Chart instances.
- The page must still expose meaningful structure and fallback content outside the island where practical.
- Read the project's installed Svelte version before using version-sensitive syntax or APIs.
