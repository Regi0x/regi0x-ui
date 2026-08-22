---
paths:
  - "internal/**/*storage*/**/*"
  - "internal/**/*media*/**/*"
  - "apps/**/*storage*/**/*"
  - "migrations/**/*"
  - "infra/**/*storage*/**/*"
---
# Storage boundaries

- Application/domain code must not assume that user media or downloadable artifacts live forever on the main VPS filesystem.
- Use a storage abstraction for externally stored media/artifacts; S3-compatible object storage is a preferred production option when appropriate.
- Local filesystem storage is acceptable for development or an intentionally bounded initial deployment, but storage keys and public URLs must remain decoupled from absolute paths.
- User uploads enter a non-public/quarantine path first and are validated/processed before publication.
- Public distribution assets should be immutable/versioned where practical.
- Keep user media, Minecraft server files, launcher artifacts, database data and backups as separate trust/data classes even when they temporarily share a disk.
- Backups must exist outside the primary VPS; the small monitoring-server disk is not a substitute for off-host backups.
