---
paths:
  - "web/**/*.{templ,html,css,js,ts,svelte}"
  - "apps/web/**/*.{templ,html,css,js,ts,svelte}"
  - "apps/admin/**/*.{templ,html,css,js,ts,svelte}"
  - "packages/ui/**/*"
---
# Regi0x Design System

- Before creating UI, search for an existing component and read the relevant section of `docs/design-system/REGI0X_DESIGN_SYSTEM_v3.md`.
- Consume semantic/component tokens, not primitive raw values, unless defining the token system itself.
- Dark and light themes ship together. Console/terminal surfaces follow the permanently-dark contract.
- `focus-visible` is an orthogonal accessibility layer and stays visible over selected/error/pressed states.
- Floating surfaces use the shared overlay/layer contract, stay within the viewport and restore focus appropriately.
- Reusable components respond to their container, not only viewport breakpoints.
- Validate realistic English and Russian strings.
- Respect reduced motion and mobile material fallbacks.
- Status colors carry meaning; do not reuse error/warning/success colors as arbitrary chart-series decoration.
- If a mockup conflicts with the design system, flag the conflict instead of encoding a one-off exception.
