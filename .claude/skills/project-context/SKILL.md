---
name: project-context
description: Show the selected Regi0x project profile and identify the smallest relevant rules before cross-cutting work.
disable-model-invocation: false
allowed-tools: Bash(printf *), Bash(cat .claude/regi0x/profile), Read
---
# Project profile context

First read `.claude/regi0x/profile` if it exists. Do not load every rule automatically.

Use the selected profile and its installed `.claude/rules/` files as the architecture source of truth:

- `regi0x-blog` -> use the Regi0x blog profile/rules plus base design/runtime rules.
- `regi0x-ui-lab` -> use the UI Lab profile/rule, canonical registry, component maturity model and Design System.
- `regi0x-status` -> use the Status monitoring profile/rule plus base security/runtime rules.
- `fidonyaa-platform` -> use only the FidonyAa rules relevant to the requested subsystem (authorization, TTS, bots, media, Minecraft, launcher, infrastructure, etc.).
- `generic`/missing -> use base rules and repository facts rather than assuming another product architecture.

For focused implementation, prefer the relevant path-scoped rule and existing repository code. Do not ask to load removed legacy handbook files.

Return a short `Applicable architecture` summary before a cross-cutting plan.
