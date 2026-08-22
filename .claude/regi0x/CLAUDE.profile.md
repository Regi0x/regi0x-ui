# Regi0x UI Lab profile

This repository powers `ui.regi0x.dev`: the canonical visual laboratory, component catalog, pattern library and example-screen reference for the Regi0x Design System.

## Authority order

1. Stable canonical implementation in this repository.
2. Stable registry metadata and component contract.
3. Regi0x Design System tokens/rules.
4. Beta component/pattern if no stable alternative exists.
5. Draft work only for experimentation; never silently reuse it in production.

## Required workflow

Before implementing UI, search the registry and existing components. Reuse or compose a stable primitive before creating anything new. New UI primitives start as Draft and must include live examples, EN/RU strings, dark/light states, narrow-width behavior, focus-visible/accessibility behavior and an AI implementation contract.

The public documentation site is a visualization of repository truth. Do not scrape `ui.regi0x.dev` as the primary implementation source when the repository is available locally.
