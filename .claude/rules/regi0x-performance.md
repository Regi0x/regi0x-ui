---
paths:
  - "web/**/*"
  - "apps/web/**/*"
  - "apps/admin/**/*"
  - "**/*.go"
---
# Performance

- SSR and small payloads are the default; ship client JavaScript only for behavior that needs it.
- Avoid unnecessary `backdrop-filter` layers and nested glass surfaces.
- Lazy-load 3D, chart and island code by route/visibility when practical.
- Avoid layout shift: reserve image/media/skeleton geometry.
- Operational screens should use static or low-cost backgrounds.
- Do not continuously animate large blurred surfaces.
- Bound server work with context/timeouts and avoid unbounded concurrency/queues.
- Measure before adding caches, pooling or complexity. State the bottleneck being solved.
- Prefer immutable caching for fingerprinted static assets and correct HTTP caching semantics.
