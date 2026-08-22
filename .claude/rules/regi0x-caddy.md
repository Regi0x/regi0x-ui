---
paths:
  - "Caddyfile"
  - "**/Caddyfile*"
  - "infra/caddy/**/*"
---
# Caddy

- Caddy owns public TLS termination, reverse proxying, security headers where appropriate, compression and static delivery.
- Internal application services should bind to loopback/private interfaces unless public exposure is explicitly required.
- Keep business authorization and identity logic out of Caddy configuration.
- Preserve real client/proxy semantics intentionally; do not trust forwarded headers from arbitrary upstreams.
- Changes to proxy timeouts, buffering, body limits or WebSocket/SSE behavior must be checked against the affected endpoint type.
- Validate Caddy configuration before deployment and keep a rollback path.
