---
paths:
  - "**/*.templ"
  - "web/**/*.html"
  - "web/**/*.go"
  - "apps/web/**/*"
  - "apps/admin/**/*"
---
# templ + htmx

- templ owns SSR markup and reusable server UI components.
- htmx owns server interaction and HTML fragment replacement.
- Prefer hypermedia: return the smallest correct HTML fragment for htmx requests and a complete document where direct navigation requires it.
- URLs and HTTP semantics remain meaningful without JavaScript where feasible.
- Keep progressive enhancement: core workflows must not depend on decorative client code.
- Use htmx response headers/OOB swaps only when they make the interaction clearer than a normal fragment response.
- Avoid client-side duplication of server-owned state.
- Do not introduce Svelte for simple toggles, filters, forms, pagination, inline editing or server-driven updates that htmx handles cleanly.
- Never manually edit generated `*_templ.go`; change `.templ` sources and regenerate.
- Preserve focus, history, validation messages, loading indicators and error behavior across swaps.
- Verify current htmx behavior against the project's installed 2.x version and official docs when an API/extension is version-sensitive.
