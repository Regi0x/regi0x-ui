---
paths:
  - "**/*.go"
  - "**/*.templ"
  - "**/*.ts"
  - "**/*.js"
  - "**/*.svelte"
  - "**/*.rs"
---
# Human, maintainable code

Code should read like it is owned by an experienced engineer who expects to maintain it for years.

- Prefer explicit domain code over generic abstraction layers.
- Names must communicate business meaning. Prefer `ResolveVoice`, `PublishRevision`, `AuthorizeServerAction` over `ProcessData`, `Manager`, `Helper` or `Utils`.
- Do not create interfaces until there is a real boundary/substitution need. Do not wrap one implementation merely to look architectural.
- Keep functions cohesive and reasonably small, but do not split linear logic into tiny ceremonial functions.
- Comments explain WHY, an invariant, protocol/security constraint, concurrency reason or non-obvious tradeoff. Delete comments that merely restate code.
- Do not generate decorative section comments, fake examples, speculative TODOs or placeholder production logic.
- Avoid "AI-shaped" overengineering: factories for simple construction, redundant DTO layers, generic repositories for unrelated domains, configuration for things that are not configurable, or wrappers around standard-library calls without policy value.
- Preserve existing project conventions unless there is a documented reason to change them.
- Error messages/log fields should be actionable and domain-specific, with no secrets.
- Review the diff before completion and remove dead/debug/generated-looking code.
