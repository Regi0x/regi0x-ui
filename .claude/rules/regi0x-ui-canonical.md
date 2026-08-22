---
paths:
  - "**/*.templ"
  - "web/**"
  - "components/**"
---
# Canonical UI use

When a canonical UI library or registry is present:

- search it before writing new markup;
- reuse stable components and patterns;
- do not hand-code a lookalike with raw Tailwind classes;
- extend a component's public API only when the new intent is broadly reusable;
- keep product-specific composites local until they prove reusable;
- never treat Draft examples as production contracts;
- preserve dark/light, EN/RU, focus-visible, reduced-motion and narrow-container behavior.
