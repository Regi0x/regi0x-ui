---
paths:
  - "**/*.go"
  - "go.mod"
  - "go.sum"
---
# Go

- Follow the Go version and module graph declared by this repository; do not code against a newer language/library API unless upgrading is requested.
- Prefer idiomatic standard-library solutions when they are simpler and sufficient.
- Return useful errors with context; preserve errors for `errors.Is`/`errors.As` when callers need classification.
- Pass `context.Context` across request/job boundaries; honor cancellation and timeouts.
- Keep interfaces small and consumer-owned where practical. Do not introduce interfaces solely for mocking.
- Avoid hidden globals and package-level mutable state.
- Make concurrency ownership, shutdown and channel lifecycle explicit. Never leak goroutines.
- Validate at trust boundaries; authorization is server-side and deny-by-default.
- Tests should target behavior and failure cases, not implementation trivia.
- Run `gofmt` on changed Go files and the repository's Go tests/checks before completion.
- Never manually edit generated files when a generator is the source of truth.
