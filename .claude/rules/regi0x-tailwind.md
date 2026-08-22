---
paths:
  - "**/*.css"
  - "**/*.templ"
  - "**/*.svelte"
  - "tailwind.config.*"
  - "package.json"
---
# Tailwind + Regi0x tokens

- Use the Tailwind major/minor installed by this repository; do not assume older configuration conventions.
- Regi0x semantic/component CSS variables are the visual source of truth.
- Prefer meaningful shared component patterns over repeating very long utility strings across many templates.
- Do not introduce raw color values, arbitrary radii, shadows, z-indexes, spacing or motion when a Regi0x token exists.
- Preserve dark/light theme parity.
- Keep utility use readable; extract repeated UI anatomy into components rather than inventing abstraction for one occurrence.
- Avoid `!important` unless resolving a documented third-party integration constraint.
- Do not make Tailwind configuration a second design system that diverges from `docs/design-system/regi0x.tokens.css`.
