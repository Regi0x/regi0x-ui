# Regi0x UI Lab

This repository is the canonical UI laboratory behind `ui.regi0x.dev`.

Install Regi0x Claude Engineering Kit with profile `regi0x-ui-lab` before substantial work.

## Non-negotiable workflow

1. Search `registry/registry.json` and existing Stable components before writing UI.
2. Reuse or compose Stable primitives. Never hand-code a lookalike locally.
3. New primitives start as Draft.
4. Every component includes live examples, EN/RU, expanded/pseudo-localized copy, Dark/Light, narrow width, normal/reduced motion, focus-visible/accessibility behavior and an AI contract.
5. Code is source of truth. The website is its visual reference.
6. Screens compose components and patterns; screens do not define local primitives.
7. Product-specific composites remain product-local until repeated reuse justifies promotion.
8. Never use fixed screenshot-sized text containers as a localization shortcut; components must survive real RU expansion.
9. Motion uses Design System tokens and progressive enhancement; no component invents its own timing/easing.
10. Run `task check` before asking for promotion or review.

## Language

Conversation may be Russian or English. Code identifiers, comments, registry keys and technical contracts are English. Human product copy is localized EN/RU.
