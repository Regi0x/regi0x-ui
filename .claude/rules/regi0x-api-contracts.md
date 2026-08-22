---
paths:
  - "api/**/*"
  - "openapi/**/*"
  - "proto/**/*"
  - "**/*.proto"
  - "internal/**/*api*/**/*"
  - "apps/**/*api*/**/*"
---
# API and protocol contracts

- Public/browser/desktop application APIs default to HTTP + JSON with an explicit versioned contract and OpenAPI where useful.
- Do not introduce Protobuf/gRPC merely because Go and Rust support it.
- Protobuf is appropriate only when a concrete interoperability, streaming, payload-size, code-generation or performance requirement justifies it.
- Never use gRPC as an artificial boundary between packages inside one process.
- Version public APIs deliberately (`/api/v1/...` or equivalent) and keep backward compatibility/migrations explicit.
- Server-side authorization applies to every API regardless of what the UI hides.
- Desktop/mobile clients receive product API credentials/tokens, never upstream provider secrets such as Twitch client secrets or raw internal database access.
- Generate clients from contracts only when generation has a clear source-of-truth and reproducible task.
