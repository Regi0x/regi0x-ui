---
paths:
  - ".env*"
  - "**/*.env"
  - "**/*.service"
  - "**/*.container"
  - "config/**/*"
  - "internal/**/*config*/**/*"
  - "deploy/**/*"
  - "infra/**/*"
---
# Configuration and secrets

- `.env.example` is documentation: grouped, commented, complete enough for local setup, and secret-free.
- `.env`, `.env.local` and machine-specific overrides are gitignored.
- Parse/validate configuration once at process startup. Required values fail fast with useful field names.
- Prefer typed configuration structs over reading environment variables throughout business code.
- Keep names stable and scoped, e.g. `HTTP_ADDR`, `TWITCH_CLIENT_ID`, `TTS_MAX_QUEUE`, `DATABASE_URL`.
- Production non-secret values may use `/etc/<product>/<service>.env` or equivalent systemd environment files.
- Production secrets should use systemd credentials (`LoadCredential=`/credential directory) or another reviewed secret source. Do not commit them or echo them into logs.
- Never place OAuth client secrets, signing keys, S3 secret keys, DB passwords in examples/docs with real values.
- Configuration changes that alter security/exposure should be reviewed and auditable where managed through an admin UI.
