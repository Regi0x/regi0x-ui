---
paths:
  - "**/*.go"
  - "**/*auth*.*"
  - "**/*oauth*.*"
  - "**/*upload*.*"
  - "**/*secret*.*"
  - "**/*token*.*"
  - "infra/**/*"
---
# Security

- Authorization is server-side, explicit and deny-by-default. Authentication is not authorization.
- Treat all browser-provided IDs, roles, names, paths, URLs and hidden fields as untrusted input.
- Protect state-changing browser flows from CSRF according to the application's auth/cookie model.
- OAuth/OIDC flows must validate state and use PKCE where applicable; validate redirect targets against explicit allowlists.
- Prevent SSRF: do not fetch arbitrary user-controlled URLs without scheme/host/IP validation and redirect re-checks.
- File uploads require explicit size/type/path policy, generated storage names where appropriate, and no path traversal.
- Secrets never enter logs, analytics, client HTML, URLs, error details or source control.
- Streamer Mode is visual privacy only; it is not authorization, encryption or secret storage.
- Database/Valkey/internal control services should not be publicly exposed unless there is an explicit reviewed requirement.
- Security-sensitive changes should invoke the `regi0x-security-reviewer` subagent before completion.
