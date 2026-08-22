---
paths:
  - "**/*.templ"
  - "**/*.html"
  - "**/*.svelte"
  - "web/**/*.{js,ts,css}"
---
# Accessibility

- Native HTML semantics first; ARIA supplements, not replaces, correct semantics.
- Every interactive control has an accessible name and visible keyboard focus.
- Keep tappable hit areas at least 44x44px; compact 32px table density is fine-pointer/keyboard only.
- Do not hide essential information only in hover tooltips.
- Modals trap focus; closing overlays restores focus to the trigger when it still exists.
- Respect `prefers-reduced-motion`; never require animation to understand state.
- Color is never the only signal for status/error/selection.
- Form errors identify what happened and what the user can do next.
- Test realistic keyboard order and Russian text expansion, not only ideal English screenshots.
