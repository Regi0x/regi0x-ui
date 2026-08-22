---
paths:
  - "components/**"
  - "patterns/**"
  - "screens/**"
  - "registry/**"
  - "web/**"
---
# Regi0x UI Lab rules

- Stable canonical components must be reused instead of recreated locally.
- Maturity: Draft -> Beta -> Stable -> Deprecated.
- Draft is experimental and must not become a production dependency without explicit promotion.
- Every component documents purpose, anatomy, variants, sizes, states, tokens, keyboard, touch, accessibility, responsive behavior, motion and EN/RU examples.
- Every screen is composed from canonical primitives/patterns; screens must not invent local primitives.
- Product-specific composites stay product-local until repeated reuse justifies promotion into the shared UI library.
- Code is source of truth; screenshots are supporting visual references only.
- Keep implementation intent-based (`variant`, `size`, `loading`) rather than raw visual values.
