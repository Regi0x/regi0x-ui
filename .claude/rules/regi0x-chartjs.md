---
paths:
  - "**/charts/**/*.{js,ts,svelte}"
  - "**/*chart*.{js,ts,svelte}"
---
# Chart.js

- Chart.js is the default for conventional 2D operational charts.
- Use the installed Chart.js version; verify plugin/controller APIs before use.
- Separate semantic status colors from neutral categorical series colors.
- Never encode state by color alone; retain labels, icons, line styles or position as appropriate.
- Missing/delayed/unavailable data must not be converted to zero.
- Tooltips and interaction must be keyboard-reachable or have an accessible equivalent.
- Destroy chart instances on island/component teardown and avoid duplicate canvases/listeners after htmx swaps.
- Prefer server-provided normalized data contracts over ad-hoc DOM scraping.
