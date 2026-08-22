---
paths:
  - "apps/**/*"
  - "cmd/**/*"
  - "internal/**/*"
  - "packages/**/*"
  - "go.mod"
  - "go.sum"
---
# Architecture

- Treat apps as deployment/security boundaries only when they need independent lifecycle, privilege or exposure.
- Shared domain code should remain reusable; do not create microservices to make the repository look sophisticated.
- Keep transport, domain and infrastructure responsibilities explicit.
- Dependencies point inward toward domain behavior; HTTP/UI/infrastructure adapt to it.
- Prefer explicit composition over global service locators.
- A new package must have a clear domain or technical responsibility; avoid miscellaneous dumping grounds.
- Realtime defaults to SSE for server-to-browser updates; WebSocket requires true bidirectional traffic.
- 3D and animation are progressive enhancement, never required to understand or operate core screens.
