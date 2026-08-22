---
paths:
  - "web/**/*"
  - "apps/**/*"
  - "internal/**/*i18n*/**/*"
  - "locales/**/*"
  - "translations/**/*"
---
# English and Russian localization

Regi0x-family products support English and Russian as first-class UI languages.

## Source of truth

- Keep user-facing copy in locale catalogs/resources, not scattered through handlers, domain services or component markup.
- Use stable English message keys such as `media.upload.title`, `minecraft.server.restart`, `common.save`.
- Code identifiers, API fields, permission keys, database values and provider identifiers remain stable English technical identifiers.
- Do not store translated labels as authorization/domain identity.
- Never concatenate translated sentence fragments. Use a whole parameterized message so grammar may differ by locale.
- Do not hand-roll plural rules. Use the project's approved CLDR-aware localization layer. Russian requires one/few/many/other handling.

## Locale resolution

Resolve locale once per request and pass it explicitly through rendering.

Preferred priority:
1. explicit locale route or explicit user action;
2. authenticated user's saved preference or locale cookie;
3. `Accept-Language` on a first visit;
4. product default locale.

Do not keep re-overriding an explicit user choice with `Accept-Language`.

For public indexable content, prefer locale-addressable URLs when SEO/shareability matters (for example `/ru/...` and `/en/...`) and emit correct canonical/hreflang metadata. For authenticated control panels, a saved profile/cookie preference is sufficient unless product requirements demand localized URLs.

## Rendering model

- SSR is the source of truth for translated page text. Do not build a second client-side translation system merely to switch language.
- Language switching should preserve the current logical route, query/filter state where safe, and return correctly localized server-rendered HTML.
- Use normal same-origin navigation or an htmx fragment/page swap for the switch. View Transitions may make this feel instant, but localization correctness must not depend on animation or JavaScript.
- Set the document `lang` attribute to the active locale on every full document response.
- Keep the implementation ready for `dir` even though EN/RU are both LTR; prefer CSS logical properties (`margin-inline`, `padding-inline`, `inset-inline`) over left/right when practical.
- In Svelte/vanilla-JS islands, use browser `Intl` APIs for locale-aware client-only dates, numbers, relative time and lists; do not duplicate server-owned translated prose in JavaScript catalogs unless the island genuinely owns that text.

## Layout safety

Russian copy often occupies more space than English. Design for content, not screenshots.

- Do not use fixed heights for text-bearing controls/cards unless overflow behavior is explicitly part of the component contract.
- Prefer `min-height`, intrinsic sizing, `min-width: 0`, wrapping and resilient grid/flex layouts.
- Buttons may grow horizontally; do not size buttons to a single English label.
- Navigation labels may wrap, collapse to an icon/overflow menu at a defined breakpoint, or use a wider container; do not silently truncate essential actions.
- Reserve truncation for content where loss is acceptable and provide the full value accessibly when needed.
- User-generated strings, IDs and URLs must not destroy layouts; use appropriate wrapping/truncation independently of localization.

## Formatting and grammar

- Dates, time, numbers, percentages, currencies, relative time and lists are locale-aware.
- Time zone and locale are separate concepts. Never infer the user's time zone from `ru` or `en`.
- Validation/error payloads use stable machine codes plus localized human messages when a client needs both.
- Translators own word order around variables. Do not assemble messages like `"Hello " + name` or `count + " users"`.

## Quality gate

Every reusable component and important screen is checked in:
- English;
- Russian;
- a pseudo-localized/expanded-copy mode when available;
- narrow mobile width and desktop width.

A useful pseudo-locale expands normal copy by roughly 30–40% and makes untranslated strings obvious. It is a test tool, never a production locale.

Missing translation keys must be detectable in development/CI. Production may fall back to the product default language, but must log/measure the missing key without exposing internal details to users.
