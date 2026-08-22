---
name: feature
description: Implement a Regi0x/FidonyAa feature with inspect-plan-build-verify discipline, canonical UI reuse, EN/RU, accessibility and repository checks.
disable-model-invocation: true
---
# Feature workflow

Use this for ordinary product feature implementation.

1. Inspect first.
   - Read the nearest existing feature with similar behavior.
   - Read manifests/lockfiles and the relevant project/profile rules.
   - For UI, inspect the canonical UI registry/components/patterns before creating markup.
2. Resolve only blocking ambiguity.
   - Ask a question only when different answers would materially change behavior, security or data shape.
   - Otherwise state a small assumption and continue.
3. Give a short implementation plan.
   - Name the files/boundaries likely to change.
   - Call out permission, migration, external API or compatibility risks.
   - Do not propose unrelated refactors.
4. Implement the smallest coherent change.
   - Reuse existing components and domain behavior.
   - Do not introduce a dependency/service/abstraction unless the task needs it and the benefit is stated.
5. Treat UI quality as acceptance criteria when UI is involved.
   - EN and RU.
   - realistic long-copy/pseudo-localized expansion when available.
   - narrow/mobile and desktop layouts.
   - dark/light if the surface supports both.
   - keyboard/focus/touch/accessibility.
   - loading, empty, partial, error, permission-denied and success states where applicable.
   - normal and reduced-motion behavior.
6. Validate progressively.
   - Run the narrowest relevant test/check first.
   - Then run the repository canonical `task check` or equivalent.
   - Never claim a check passed unless it actually ran successfully.
7. Self-review before reporting completion.
   - no duplicate canonical UI primitives;
   - no architecture or dependency drift;
   - no secrets/private data in logs or UI;
   - authorization is enforced server-side;
   - no untranslated hard-coded product copy on localized surfaces.
8. Report succinctly.
   - what changed;
   - checks run and results;
   - migrations/deploy notes;
   - any unresolved decision or risk.
