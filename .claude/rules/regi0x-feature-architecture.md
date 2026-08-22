---
paths:
  - "apps/**/*"
  - "cmd/**/*"
  - "internal/**/*"
  - "web/**/*"
  - "packages/**/*"
---
# Feature-oriented architecture

Use Feature-Sliced Design principles selectively, not its frontend folder names as dogma.

- Group business behavior by cohesive product feature/domain where that improves ownership and discoverability.
- Keep platform/infrastructure capabilities separate from product features.
- A feature exposes a small intentional public surface; other features must not depend on its private internals.
- Shared code is for genuinely cross-cutting primitives/components, not a dumping ground for code with unclear ownership.
- Prefer vertical cohesion over technical folders that scatter one feature across unrelated locations.
- Go domain/application behavior must not be forced into `entities/widgets/features` terminology when normal Go package boundaries are clearer.
- UI belonging to a feature should stay near that feature where practical; global design-system components remain shared.
- Cross-feature communication should use explicit application interfaces/events/contracts, not direct access to another feature's storage tables or private filesystem paths.
- Add a new deployment service only for a real lifecycle, privilege, scaling or exposure boundary; package boundaries do not imply network boundaries.
