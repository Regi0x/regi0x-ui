# Regi0x — Design System & UI Kit v3

A complete visual, interaction and implementation reference for the Regi0x product family.
This is the shared source of truth for **designers, frontend developers and AI coding agents**.
It defines not only how Regi0x looks, but also how components behave, respond, expose states,
map to tokens, meet accessibility requirements and should be implemented in production code.

**Audience contract**
- **Designer:** use foundations, component anatomy, states, responsive rules and content guidance.
- **Developer:** consume semantic/component tokens and implement the documented behavior contract.
- **AI coding agent:** treat normative rules, tokens and component contracts as hard constraints; do not invent one-off visual values.

Companion implementation files:
- `regi0x.tokens.css` — production-ready CSS custom properties for dark and light themes.
- `regi0x.tokens.json` — machine-readable token map for tooling and code generation.
- `CLAUDE.md` — concise project instructions for Claude Code and similar repository-aware coding agents.

**Design language:** calm, dark-first, material and translucent rather than
flat — depth reads through layered glass surfaces over a soft aurora glow,
in the spirit of visionOS materials and the Arc/Zen browser chrome, tuned
down to stay legible and fast rather than decorative. Light mode is a fully
considered second theme, not a simple inversion.

---

## Table of contents

### Foundations
1. [Principles](#1-principles)
2. [Brand mark](#2-brand-mark)
3. [Color](#3-color)
4. [Typography](#4-typography)
5. [Grid, spacing & breakpoints](#5-grid-spacing--breakpoints)
6. [Radius](#6-radius)
7. [Elevation & shadow](#7-elevation--shadow)
8. [Motion](#8-motion)
9. [Iconography](#9-iconography)

### UI kit and product patterns
10. [Component catalog](#10-component-catalog)
11. [Patterns — example screens](#11-patterns--example-screens)
12. [Accessibility](#12-accessibility)
13. [Content & localization](#13-content--localization)

### System contracts
14. [Design Tokens](#14-design-tokens)
15. [Component State Matrix](#15-component-state-matrix)
16. [Layering & Overlay Contract](#16-layering--overlay-contract)
17. [Responsive Behavior Contract](#17-responsive-behavior-contract)
18. [Data Visualization](#18-data-visualization)
19. [Content & UX Writing](#19-content--ux-writing)
20. [Performance Budget](#20-performance-budget)
21. [Do / Don't Rules](#21-do--dont-rules)
22. [Implementation Contract](#22-implementation-contract)
23. [Table System](#23-table-system)
24. [Typography Usage Rules](#24-typography-usage-rules)
25. [Changelog & Governance](#25-changelog--governance)
26. [Component Definition Template](#26-component-definition-template)
27. [System Completion Checklist](#27-system-completion-checklist)

### Production handoff
28. [Quick Start by Role](#28-quick-start-by-role)
29. [Production CSS Variables](#29-production-css-variables)
30. [Theme Contract](#30-theme-contract)
31. [Component Spec Standard — Figma to Code](#31-component-spec-standard--figma-to-code)
32. [AI Coding Agent Contract](#32-ai-coding-agent-contract)
33. [QA Acceptance Matrix](#33-qa-acceptance-matrix)
34. [Repository & Delivery Structure](#34-repository--delivery-structure)

---

## 1. Principles

1. **Dark by default, light fully supported.** The product opens in dark
   mode; light is a complete, separately-tuned theme — not dark with the
   colors flipped. The user picks explicitly; the interface never follows
   the OS setting on its own, so what one person sees always matches what
   they show someone else.
2. **Material, not flat.** Surfaces are translucent layers of "glass" that
   let a soft, blurred color wash show through behind them in dark mode.
   Depth comes from material thickness and shadow, not from heavy borders.
3. **One token, everywhere it's used.** A color, radius, shadow or timing
   value is defined once and reused by name. Nothing is a one-off hex value
   picked by eye.
4. **Components adapt to their box, not just the screen.** The same card
   might sit in a full-width grid or a narrow sidebar column — it should
   look right in both, adjusting its own density rather than assuming it
   owns the viewport.
5. **Accessible by default.** Every interactive control has a visible focus
   state, every icon-only control has a text label for assistive tech,
   every **approved semantic text/background pairing must be validated to WCAG AA**
   in both themes, and motion respects a user's OS-level "reduce motion" preference.
6. **Floating surfaces never leave the screen.** Dropdowns, tooltips, menus
   and popovers always stay fully inside the viewport — if a menu would
   overflow an edge, it repositions itself rather than getting clipped.

---

## 2. Brand mark

- **Wordmark:** `Regi0x`, set in the UI's primary typeface, medium weight.
- **Mark:** a rounded-square tile filled with the brand gradient (Primary →
  Secondary, 135°), carrying a single bold letter "R" in white. Used at
  small sizes (32–48px) as an app icon / avatar-style mark next to the
  wordmark in navigation.
- **Gradient:** the one and only brand gradient — Primary to Secondary,
  135° angle. Used for the mark, primary emphasis fills, and decorative
  background blobs. It should never drift into a second, different gradient
  elsewhere in the product.

---

## 3. Color

### 3.1 Palette (raw swatches)

The base palette every semantic color is built from. Neutrals carry a very
slight cool/blue cast so greys never look muddy next to the violet brand.

**Neutral**
`50` `#f7f7fa` · `100` `#eeeef3` · `200` `#e0e0e8` · `300` `#c7c7d4` ·
`400` `#9c9cb0` · `500` `#74748a` · `600` `#55556a` · `700` `#3d3d4f` ·
`800` `#262634` · `900` `#16161f` · `950` `#0b0b11` · white `#ffffff`

**Violet — brand**
`300` `#c4b5fd` · `400` `#a78bfa` · `500` `#8b5cf6` · `600` `#6a58f0` ·
`700` `#6247ea` · `800` `#4c33c4`

**Blue — secondary**
`400` `#60a5fa` · `500` `#3b82f6` · `600` `#2563eb` · `700` `#1d4ed8`

**Teal — accent**
`400` `#2dd4bf` · `500` `#14b8a6` · `600` `#0d9488` · `700` `#0f766e`

**Amber — sunrise (warm accent)**
`400` `#fbbf24` · `500` `#f59e0b` · `600` `#b45309`

**Green — success** · `400` `#4ade80` · `500` `#22c55e` · `700` `#166534`
**Yellow — warning** · `400` `#facc15` · `700` `#854d0e`
**Red — error** · `400` `#f87171` · `500` `#ef4444` · `700` `#b91c1c`
**Rose** (reserve accent) · `400` `#fb7185` · `500` `#f43f5e`

*Rule of thumb baked into the ramp: the 400 step is for text sitting on a
dark surface, 600–700 for text sitting on a light surface, and 500 is the
solid/fill color.*

### 3.2 Semantic colors

What each color *means*. Design against these, not the raw palette above.

| Role | Dark theme | Light theme | Where it's used |
|---|---|---|---|
| Background | `#0b0b11` | `#f4f4f8` | page canvas |
| Background, subtle | `#16161f` | `#eeeef3` | recessed regions, code blocks |
| Surface | white @ 4.5% | white @ 86% | base card fill |
| Surface, raised | white @ 7.5% | `#ffffff` | raised card, popover fill |
| Surface, active | white @ 11% | `#eeeef3` | hover / pressed fill |
| Surface, opaque | `#14141d` | `#ffffff` | fallback where translucency can't be used (small screens) |
| Glass, thin | dark navy @ 55% | white @ 60% | lightest translucent material |
| Glass, standard | dark navy @ 72% | white @ 78% | header bars, cards over the aurora background |
| Glass, thick | dark navy @ 88% | white @ 92% | drawers, command palette |
| Border, hairline | white @ 9% | black @ 10% | default dividers/outlines |
| Border, strong | white @ 17% | black @ 20% | emphasized outlines, focus-adjacent borders |
| Text, primary | `#f4f4f7` | `#16161f` | body copy, headings |
| Text, secondary | `#a6a6b8` | `#55556a` | supporting copy, meta |
| Text, tertiary | `#7d7d94` | `#6b6b80` | placeholders, disabled labels |
| Text, on solid fill | `#0b0b11` / `#ffffff` | `#ffffff` | text sitting on a filled surface |
| **Primary** | Violet 600 fill / Violet 400 action text | Violet 700 fill/text | brand fills, primary buttons, links-as-actions |
| Primary, hover | Violet 700 fill / Violet 300 text-link hover | Violet 800 fill / Violet 800 text-link hover | |
| Primary, active/pressed | Violet 800 | Violet 800 | |
| Primary, soft fill | Violet @ 18% | Violet @ 11% | tinted backgrounds (selected nav item, soft badge) |
| Primary, text-on-soft | Violet 300 | Violet 700 | text/icons sitting on the soft fill above |
| **Secondary** | Blue 500 / Blue 400 text | Blue 600 / Blue 600 text | links, informational accents |
| **Accent** | Teal 500 fill / Teal 400 text | Teal 600 fill / Teal 700 text | tertiary highlight, rarely the lead color |
| **Sunrise** | Amber 500 / Amber 400 text | Amber 500 / Amber 600 text | warm highlight, "new" markers |
| **Success** | Green 500 fill / Green 400 text / 15% soft | Green 500 fill / Green 700 text / 12% soft | positive state, confirmations |
| **Warning** | Yellow 400 fill/text / 15% soft | Yellow 400 fill / Yellow 700 text / 18% soft | caution state |
| **Error** | Red 500 fill / Red 400 text / 15% soft | Red 500 fill / Red 700 text / 10% soft | destructive actions, errors |
| **Info** | Blue 500 fill / Blue 400 text / 15% soft | Blue 500 fill / Blue 700 text / 10% soft | neutral informational state |
| Console / terminal surface | `#08080d` bg, `#c7c7d4` text, `#8a8a9e` dim text | `#16161f` bg, `#d4d4de` text, `#9494a6` dim text | **fixed pair — terminal-style surfaces keep a permanently dark palette in both themes**, like a code editor |

**Rule:** every state color (success / warning / error / info) is always
used as a *fill + text + soft-background* trio together — never mix a fill
from one color with a soft background from another.

**Contrast contract:** a palette step is not automatically an approved text color.
Text roles use the semantic mappings above and must be checked against the actual
composited surface. Large-text or non-text exceptions must be documented explicitly.
For primary filled buttons, use white label text on Violet 600/700/800 fills; do not
switch the label to dark text between interaction states.

### 3.3 Background treatment (dark theme)

Dark-theme pages sit over a fixed, heavily blurred two-tone glow: a Primary
violet bloom in the upper-left and a Secondary blue bloom in the
lower-right, each very low opacity (10–14%), extremely soft (roughly a
110px blur). Surfaces float above it as translucent glass so page depth
reads from material thickness. On small screens this glass falls back to a
plain opaque surface color for performance — design both states.

### 3.4 Material implementation values

The descriptive glass names above map to exact implementation values. These values are
starting tokens and may only change through the design-system governance process.

| Material | Dark | Light | Backdrop blur | Saturation |
|---|---|---|---:|---:|
| Glass, thin | `rgba(12,14,26,.55)` | `rgba(255,255,255,.60)` | 12px | 115% |
| Glass, standard | `rgba(12,14,26,.72)` | `rgba(255,255,255,.78)` | 18px | 120% |
| Glass, thick | `rgba(12,14,26,.88)` | `rgba(255,255,255,.92)` | 24px | 125% |

On constrained devices or below the tablet threshold, use `Surface, opaque` and set
backdrop blur to `0`; preserve dimensions, hierarchy and contrast.

---

## 4. Typography

**Typefaces**
- **UI / body:** Inter (400 / 500 / 600 / 700)
- **Monospace:** JetBrains Mono (400 / 500 / 600) — for code, console output,
  file paths, IPs, tabular numeric readouts

**Type scale**

| Style | Size / Line height | Tracking | Weight | Use |
|---|---|---|---|---|
| Display, large | 57 / 64 | −3% | 600 | hero headline, marketing only |
| Display, medium | 45 / 52 | −2.5% | 600 | section splash headline |
| Headline | 32 / 40 | −2% | 600 | page title |
| Title | 22 / 28 | −1.5% | 600 | card / section title |
| Body, large | 17 / 24 | 0 | 400 | lead paragraph |
| Body | 15 / 22 | 0 | 400 | default running text |
| Caption | 12 / 16 | 0 | 400–500 | labels, meta text, table headers |
| Caption, small | 11 / 14 | 0 | 400–500 | dense UI — status pills, table sub-values |

A stylistic note for the type: Inter is used with its "single-storey" `a`
and `g` alternates enabled, which reads a little closer to San Francisco —
worth matching if hand-drawing type in mockups rather than placing real text.

---

## 5. Grid, spacing & breakpoints

**Spacing unit:** 4px base grid. All padding, gaps and margins are multiples
of 4px (4, 8, 12, 16, 24, 32, 48, 64…).

**Page frame widths**
- Outer content cap: **1440px**
- Marketing content container: **1200px**
- Long-form prose measure: **60–75ch** (do not allow body paragraphs to span the full marketing container)

**Viewport breakpoints** (for page-level layout / frame sizing)
| Breakpoint | Width | Notes |
|---|---|---|
| Mobile | < 480px | single column, drawer navigation |
| Small | 480px | |
| Tablet | 768px | glass/blur effects become available above this width |
| Desktop | 1024px | sidebar becomes permanently visible/static above this width |
| Large | 1280px | |
| Extra large | 1440px | content stops growing past this |

**Component-level responsiveness:** beyond page layout, individual
components (tables, stat cards, file listings) should be designed to adapt
to *their own* width, not just the screen — e.g. a data table shows fewer
columns when placed in a narrower panel, independent of overall screen size.
Suggested internal thresholds: 256 / 320 / 384 / 448 / 512 / 576 / 672 /
896 / 1152px.

**Control height ladder** — one shared scale so a button and the field next
to it always line up:
| Size | Height |
|---|---|
| Small | 32px |
| Medium | 40px |
| Large | 48px |
| Touch target minimum | 44px — never design a tappable control smaller than this |

---

## 6. Radius

| Token | Value | Use |
|---|---|---|
| XS | 4px | chips, focus-ring corner |
| SM | 8px | buttons, inputs, small controls |
| MD | 12px | cards (default) |
| LG | 16px | elevated cards, side sheets |
| XL | 20px | modals |
| 2XL | 24px | large panels, section headers |
| 3XL | 32px | hero / marketing blocks |

---

## 7. Elevation & shadow

Every elevated surface uses **two shadow layers together** — a tight
"contact" shadow plus a wide, soft "diffuse" shadow. A single blur alone
reads either muddy or flat; the combination is what makes something feel
like it's actually lifted off the page.

| Level | Dark theme | Light theme | Use |
|---|---|---|---|
| E0 | none | none | flush with the page |
| E1 | contact 1px/2px @ 40% black | contact 1px/2px @ 6% navy | subtle separation (input fields) |
| E2 | E1 + soft 4px/12px @ 45% black | E1 + soft 4px/12px @ 10% navy | default card lift |
| E3 | tight 1px/3px @ 42% + wide 12px/28px @ 55% black | same, @ 7% / 14% navy | dropdowns, popovers |
| E4 | tight 2px/6px @ 45% + wide 28px/60px @ 70% black | same, @ 8% / 18% navy | modals, command palette |
| Glow | soft violet bloom, 8px/28px @ 65% (dark) / 45% (light) opacity | | primary buttons, active/focused emphasis states |
| Top highlight | thin 1px inset light line at 6% (dark) / 90% (light) white | | adds a "glass edge" catch-light to raised glass surfaces |

Primary call-to-action buttons typically combine the E2 lift **and** the
violet glow together for extra emphasis.

---

## 8. Motion

**Easing curves**
| Curve | Feel | Default use |
|---|---|---|
| Standard | balanced ease | general-purpose transitions |
| Soft-out | fast start, gentle settle | default for anything entering the screen |
| Spring (no overshoot) | quick snap, no bounce-back | scale-in reveals (menus, popovers) — deliberately *without* a bouncy overshoot, which reads as cheap once you notice it |

**Named motion treatments**
| Motion | Duration | Description |
|---|---|---|
| Fade in | 280ms | opacity only |
| Slide up | 320ms | fades in while rising 12px |
| Scale in | 240ms | fades in while scaling from 94% → 100%, spring easing — used for menus/popovers |
| Blur in | 400ms | fades in while un-blurring from a 12px blur |
| Shimmer | 1.8s, linear, looping | diagonal light sweep across loading skeletons |
| Indeterminate | 1.4s, looping | traveling bar segment for progress with unknown duration |
| Ambient drift | 34–42s, looping | very slow, barely-perceptible drift of the background glow blobs — marketing/landing background only |

**Theme switch:** changing between dark and light is a circular reveal that
grows outward from wherever the toggle was pressed, roughly 380ms, rather
than a plain cross-fade — it should feel like the new theme "wipes in" from
that point.

**Reduced motion:** every animation and transition must have a
near-instant fallback for users with the OS-level "reduce motion"
accessibility setting enabled — treat this as a hard requirement, not a
nice-to-have.

**A standing rule for entrance animations:** anything animating *into* view
should animate `opacity` (and optionally position/scale) only — never rely
on a moving/transformed element to also host a menu, tooltip or modal
anchored to it, since that combination is what breaks positioning.

---

## 9. Iconography

**Library:** Lucide (lucide.dev) — consistent 2px stroke weight, geometric,
rounded joins. Product/UI icons come from Lucide. **Official brand marks are the only
standard exception**: OAuth/provider logos such as Google, GitHub, Twitch and Discord
must use their current official brand assets rather than a Lucide approximation.
One-off decorative icon families are not allowed.

**Sizes** — three fixed sizes cover essentially everything:
| Size | Pixels | Use |
|---|---|---|
| Small | 16px | inline with caption/body text, table rows |
| Medium | 20px | buttons, list items, card headers |
| Large | 24px | feature callouts, empty states |

**Rule:** icons are decorative by default — the meaning must always come
from adjacent text or a label, an icon is never the *only* way to identify
what a control does.

---

## 10. Component catalog

### 10.1 Actions
- **Button** — variants: Primary, Secondary, Tertiary, Ghost, Destructive.
  Sizes: Small / Medium / Large. States: default, hover, active/pressed,
  focused, loading (spinner replaces label), disabled, icon-only (square,
  requires an accessible label).
- **Button Group** — a connected row of buttons sharing one border, no gaps.
- **Split Button** — a primary action fused to a small chevron trigger that
  opens a menu of related actions.
- **Dropdown Button** — a button that opens an anchored menu.

### 10.2 Forms
- **Field** — the label + helper/hint text + error message wrapper that
  every input sits inside; error state recolors the hint text and the
  control's border/ring to the Error color.
- **Text Input** (+ leading-icon variant, + password variant with a
  show/hide toggle)
- **Textarea**
- **Select** (native-feeling dropdown)
- **Combobox** — a searchable/filterable select; shows its placeholder as
  real, visible text even before anything is selected.
- **Checkbox / Radio / Switch** — restyled native controls, not
  custom-drawn, so they keep working correctly with autofill and assistive
  tech.
- **Slider**
- **Segmented control** — a connected row of mutually-exclusive options,
  styled like a physical segmented switch.
- **Steps** — numbered progress indicator for multi-step flows/wizards.
- **OTP input** — a row of single-character boxes for one-time codes.

### 10.3 Surfaces
- **Card** — three material weights:
  - *Default* — flat, sits directly on the page.
  - *Glass* — translucent, floats over the background glow (falls back to
    opaque on small screens).
  - *Elevated* — opaque and lifted with shadow, for content that must stay
    legible no matter what's behind it.
  - Composes from: header, body, footer, title, description.
- **Feature Card** — icon + title + short body, for feature grids.
- **Stat Tile** — icon, label, big numeric value, and a trend indicator
  (up / down / flat, each with its own color and arrow). The value text
  should shrink gracefully in narrow layouts rather than overflow.

### 10.4 Feedback & status
- **Badge** (soft) / **Badge, solid** / **Count badge** — semantic tones:
  Neutral, Brand, Success, Warning, Error, Info.
- **Tag**, **Chip** (dismissible), **Kbd** (a small pill showing a keyboard
  shortcut, e.g. `⌘K`).
- **Status Dot** — a small colored dot, optionally pulsing, with a label.
- **Status Pill** — a labeled pill for lifecycle states: Pending, In
  Progress, Submitted, In Review, Success, Failed, Expired — each mapped to
  its own color and icon.
- **Alert** — an inline message block with icon + tone (info / success /
  warning / error).
- **Banner** — a full-width announcement strip, optionally dismissible.
- **Toast** — a transient corner notification.
- **Progress bar** — determinate (fills to a %) and indeterminate (looping
  segment) variants.
- **Spinner**
- **Skeleton** — loading placeholder blocks with a shimmer sweep.
- **Empty State** / **Error State** — centered icon + message + optional
  action, for a list/panel with nothing (or something wrong) to show.

### 10.5 Overlays
- **Modal** — centered dialog with a dimmed backdrop.
- **Sheet** — a panel that slides in from a screen edge.
- **Dropdown Menu** — anchored to its trigger; items support icons, a
  separator, and a destructive (red) variant for delete-type actions.
- **Tooltip** — short hint on hover/keyboard-focus; top, bottom, left or
  right anchored. Never the only way to access information (not usable on
  touch).
- **Command Palette** — a centered search dialog (⌘K-style), keyboard
  navigable with arrow keys, shows a filtered, categorized list of results.

**Positioning rule for all floating surfaces:** a dropdown, tooltip,
combobox list or palette must always stay fully within the visible
viewport — if it would overflow an edge (especially the right edge on
narrow screens), it flips or shifts its anchor point rather than being
clipped or scrolling the page horizontally.

### 10.6 Navigation
- **Sidebar** — collapsible; permanently visible on desktop, an off-canvas
  drawer with a dimming scrim on mobile/tablet.
- **App Bar / Site Header** — top bar with search, and trailing controls
  (e.g. theme toggle).
- **Browser-style Tabs** — a row of closable-looking tabs in the Arc/Zen
  browser style, for switching between open contexts.
- **Breadcrumbs**
- **Pagination** — numbered pages with a sliding window (e.g. shows 5 pages
  around the current one, plus first/last).
- **Theme Toggle** — sun/moon icon switch; see the circular-reveal motion
  in §8.
- **Language Switch** — a small control for switching interface language.

### 10.7 Data display
- **Table** — header, body, rows and cells; horizontally scrollable when
  content is wide, rather than shrinking columns illegibly.
- **Timeline** — a vertical list of dated events connected by a line.
- **Queue List** — an ordered list of pending/in-flight items.
- **Meter** — a segmented capacity gauge (e.g. "6 of 10 slots used").
- **Console** — a read-only, monospaced log viewer; log lines are tinted by
  level (info / warning / error).
- **Terminal** — a Console plus a live command-line input at the bottom,
  with local echo and up/down arrow history recall.
- **Ring Gauge** — a circular percentage indicator.
- **Bar Chart** — simple labeled vertical bars.
- **Key/Value list** — a two-column label → value list, values optionally
  monospaced.
- **Sparkline** — a small inline trend line, tone-colored.

### 10.8 Files & transfer
- **Path Breadcrumbs** — every folder in the current path is individually
  clickable.
- **File Browser** — a listing table where folders sort above files, each
  file kind (folder, text, archive, image, package/jar, generic binary) has
  its own icon and tint. Wide columns (size, modified date, permissions)
  hide progressively as the available width shrinks, rather than all at
  once.
- **Transfer Queue** — a list of in-progress uploads/downloads, each with a
  live progress bar while active and a status pill once finished or failed.
- **SFTP / Connection Card** — displays host, port, username and a security
  fingerprint, each value masked (see Secret Value below), with a warning
  note to verify the fingerprint before trusting a new connection.

### 10.9 Secrets & privacy
- **Secret Value** — a masked field for sensitive values (API tokens,
  addresses, links, keys): the value is visually hidden behind a
  blurred/speckled overlay (not replaced by dots), with a separate
  eye-toggle to reveal it and a copy button that works even while hidden.
- **Streamer Mode Toggle** — a persistent, deliberate global switch (styled
  as a Switch, not a spoiler) that blurs every sensitive value on screen at
  once — designed around "the risk is a camera pointed at the screen," so
  it's an always-visible posture control rather than something dismissed
  per field.
- **Sensitive wrapper** — marks any block of content (not just text fields)
  as subject to streamer-mode blurring, e.g. a whole card of connection
  details.

**Privacy boundary:** Streamer Mode is a **visual privacy feature, not a security
boundary**. Blurred values may still exist in the DOM/application state. Implementations
must separately define screen-reader exposure, copy behavior, exported/screenshot content
and logging. Copying a hidden value should show neutral confirmation without revealing
the secret in the toast.

### 10.10 Authentication
- **OAuth Button** — branded sign-in buttons for Twitch, GitHub, Google,
  Discord, each with correct brand color and icon.
- **Sign-in Card** — title + subtitle + stacked OAuth buttons.
- **Permission Scope row** — icon + title + short description, for
  consent/authorization screens listing what access is being requested.

### 10.11 Monitoring
- **Uptime Bar** — a strip of small segments representing time slices,
  colored Up / Degraded / Down / Unknown, with an overall uptime percentage
  (Kuma/status-page style).
- **Service Row** / **Service List** — a monitored service's name, status
  and latency, in a list.
- **Server Panel** — the primary lifecycle control block for a managed
  server: name, address, status (Online / Starting / Offline), and
  Start/Stop/Restart actions.
- **Player List** — connected users with a role badge (Owner, Admin,
  Moderator, Player), each role its own tone.

### 10.12 Visual / ambient
- **3D visual treatments** — three ambient background/hero visualizations
  available: a soft drifting color-field gradient, a rotating knotted
  geometric form, and a refractive "glass" blob scene with soft shadows and
  iridescent highlights. Used for hero sections and empty large surfaces;
  should always be able to fall back to a static gradient image.
- **Spoiler reveal** — Telegram-style: content is fully hidden behind a
  blurred, speckled cover with a diagonal sweep animation; a single tap/click
  reveals it.

---

## 11. Patterns — example screens

Full product surfaces already established in this system, useful as a brief
for what a designer should be able to compose from the components above:

- **Marketing landing page** — hero, feature grid, ambient 3D visual.
- **Documentation site** — GitBook-style: persistent left sidebar nav,
  centered content column, right-hand table-of-contents rail, previous/next
  pager, in-page search.
- **Authentication flow** — sign-in card with OAuth buttons, OTP entry,
  permission/consent screen.
- **Admin panel / dashboard** — stat tiles row, filterable data table with
  row-level and bulk actions.
- **Monitoring dashboard** — service list with uptime bars and sparklines,
  status-page style.
- **Server control panel** — a full operational screen: sidebar list of
  servers, a header with live status and start/stop/restart controls, and
  tabs for Overview (stats + resource gauges), Console (live terminal),
  Files (browser + SFTP + transfer queue), Players, and Settings (including
  a clearly separated destructive "danger zone").
- **Command palette** — global ⌘K search overlay available from anywhere in
  the product.

---

## 12. Accessibility

Non-negotiable baseline for every mockup:

- **Contrast:** every approved semantic text/background pairing must meet WCAG AA
  in both themes. Check the final composited color for translucent surfaces; do not
  approve a pairing based only on raw palette swatches.
- **Focus:** every interactive element gets a visible focus ring when
  navigated to by keyboard (a 2px Primary-colored outline, 2px offset).
  Focus is restyled for aesthetics, never removed.
- **Touch targets:** minimum 44×44px for anything tappable.
- **Icon-only controls:** always need an accessible label, even though it
  isn't visible on screen.
- **Motion:** every animated transition needs a near-instant fallback for
  users with reduced-motion enabled.
- **High-contrast mode:** the focus ring must remain visible even when a
  user's OS strips custom colors (Windows High Contrast Mode) — design it
  as a strong outline that would survive that, not a subtle color-only cue.

---

## 13. Content & localization

The product ships in **English and Russian**. Design guidance:

- Navigation, chrome, buttons, labels, and section headings are fully
  translated in both languages — leave room for Russian strings running
  noticeably longer than their English equivalents.
- Long-form documentation/explanatory prose inside component reference
  pages stays English-only by deliberate choice (shared technical
  vocabulary) — don't assume every block of body text needs a translated
  layout variant.
- English is the default language shown to a new visitor; dark is the
  default theme.

---

## 14. Design Tokens

The design system uses a three-layer token architecture:

1. **Primitive tokens** — raw values such as palette steps, spacing units, radii and durations.
2. **Semantic tokens** — values expressing product meaning: surface, text, action, state and focus.
3. **Component tokens** — values consumed by a specific component.

Designers and product code should consume semantic or component tokens wherever possible. Primitive tokens are implementation inputs, not design decisions.

### 14.1 Token naming

Use dot-separated semantic names in documentation and stable kebab-case names in CSS.

Examples:

- `color.violet.600`
- `color.text.primary`
- `color.action.primary`
- `color.state.error`
- `space.4`
- `radius.md`
- `shadow.e3`
- `motion.duration.fast`
- `component.button.primary.background`

CSS examples:

```css
--color-text-primary
--color-action-primary
--space-4
--radius-md
--shadow-e3
--motion-duration-fast
--button-primary-background
```

### 14.2 Primitive token families

**Spacing**

`space.1 = 4px`, `space.2 = 8px`, `space.3 = 12px`, `space.4 = 16px`,
`space.6 = 24px`, `space.8 = 32px`, `space.12 = 48px`, `space.16 = 64px`.

**Radius**

`radius.xs = 4px`, `radius.sm = 8px`, `radius.md = 12px`,
`radius.lg = 16px`, `radius.xl = 20px`, `radius.2xl = 24px`,
`radius.3xl = 32px`.

**Control heights**

`control.sm = 32px`, `control.md = 40px`, `control.lg = 48px`,
`control.touch = 44px`.

**Motion duration**

`motion.duration.instant = 0ms`,
`motion.duration.fast = 120ms`,
`motion.duration.normal = 180ms`,
`motion.duration.medium = 240ms`,
`motion.duration.slow = 320ms`,
`motion.duration.ambient = 40000ms`.

Named component motions may reference these primitives rather than introducing arbitrary durations.

### 14.3 Token hierarchy rule

Never create a component-specific raw value when an existing semantic token expresses the same intent.

Bad:

```css
background: #724de8;
```

Good:

```css
background: var(--color-action-primary);
```

A component token is appropriate when the component intentionally maps a semantic token to a role:

```css
--button-primary-background: var(--color-action-primary);
```

---

## 15. Component State Matrix

Every interactive component must define its state model before implementation.

### 15.1 Core states

The standard interaction vocabulary is:

- Rest
- Hover
- Focus
- Focus-visible
- Pressed
- Disabled
- Loading
- Selected
- Checked
- Invalid
- Success
- Warning
- Readonly

Not every component exposes every state. A component must explicitly document which states apply.

### 15.2 State precedence

State precedence governs the component's **base visual state**:

1. Disabled
2. Loading
3. Invalid / destructive semantic state
4. Selected / checked
5. Pressed
6. Hover
7. Rest

**Focus-visible is orthogonal, not mutually exclusive.** It is an accessibility layer
rendered on top of the applicable base state, e.g. `selected + focus-visible`,
`invalid + focus-visible` or `pressed + focus-visible`. It must remain perceivable
without erasing the semantic state beneath it.

Disabled controls never expose hover or pressed feedback. Loading controls preserve
their footprint and prevent duplicate submission.

### 15.3 State contract

For every component document:

- visual treatment
- keyboard behavior
- pointer behavior
- touch behavior
- accessible name
- accessible state
- focus behavior
- loading behavior
- disabled behavior
- reduced-motion behavior

This prevents visual-only implementations from becoming the de facto specification.

---

## 16. Layering & Overlay Contract

All floating UI uses one shared overlay architecture.

### 16.1 Layer hierarchy

Recommended logical layers:

| Layer | Purpose |
|---|---|
| 0 | Page content |
| 10 | Sticky content |
| 20 | App bar / sidebar |
| 30 | Dropdown / context menu |
| 40 | Popover / tooltip |
| 50 | Toast / transient feedback |
| 60 | Modal or sheet scrim |
| 70 | Modal / sheet |
| 80 | Command palette |
| 90 | System-critical UI |

The exact implementation values may differ, but the relative order must remain stable.

### 16.2 Overlay root

Dropdowns, popovers, tooltips, menus, sheets, modals and command palettes render through a shared overlay root.

Floating surfaces must not depend on an ancestor's stacking context.

Transforms, filters and animations on ordinary content must not break the positioning of an anchored overlay.

### 16.3 Collision behavior

Floating surfaces:

- never intentionally clip against the viewport
- flip when there is insufficient space
- shift along the secondary axis when required
- remain reachable by keyboard
- never create horizontal page scrolling
- preserve a small viewport gutter

Tooltips are informational and must never be the sole way to discover an essential action.

### 16.4 Focus ownership

Opening an overlay transfers focus according to its interaction model.

Closing it restores focus to the trigger whenever the trigger still exists.

Dialogs trap focus while open. Menus use roving/active-item keyboard navigation. Tooltips never steal focus.

---

## 17. Responsive Behavior Contract

Viewport breakpoints remain page-level thresholds:

- `<480px` — mobile
- `≥480px` — small
- `≥768px` — tablet
- `≥1024px` — desktop
- `≥1280px` — large
- `≥1440px` — extra large

These names describe layout thresholds, not component requirements.

### 17.1 Component-first responsiveness

Components must primarily respond to their available container width.

Use container queries or equivalent component-level mechanisms where supported.

Suggested internal thresholds remain:

`256 / 320 / 384 / 448 / 512 / 576 / 672 / 896 / 1152px`.

### 17.2 Touch target rule

A control may have a 32px or 40px visual box, but its interactive hit area on touch devices must remain at least `44×44px`.

Do not enlarge visual controls solely to satisfy the hit target when an invisible hit area can preserve the intended density.

### 17.3 Mobile material rule

Below the tablet threshold, expensive glass effects may fall back to opaque surfaces.

The fallback must preserve:

- hierarchy
- contrast
- elevation
- state visibility
- component dimensions

A performance fallback is a visual implementation change, not a different component.

---

## 18. Data Visualization

Charts and operational metrics use the same semantic color language as the rest of the product.

### 18.1 Semantic meaning

- Green — healthy / positive
- Yellow — warning / attention
- Red — error / unhealthy / destructive
- Blue — informational
- Violet — product/brand emphasis
- Teal — secondary accent

Color must not be the only channel communicating a state. Use labels, icons, patterns or position where necessary.

### 18.1.1 Status colors vs categorical series

Semantic green/yellow/red are reserved for health, warning and error meaning. Do not
use them as arbitrary series colors in a neutral comparison chart, because that invents
meaning the data does not carry. Neutral multi-series charts use a separate categorical
palette (brand violet, blue, teal, rose and neutral variants), with labels/legend markers
and non-color differentiation when series must remain distinguishable for color-vision deficiencies.

### 18.2 Numeric formatting

Use consistent compact notation:

- `<1,000` — full value
- `1,000–999,999` — locale-aware grouped value
- `≥1M` — compact notation where space is constrained

Operational values retain their units:

- `132 ms`
- `72%`
- `13.4 GB`
- `99.982%`

Do not force unrelated metrics into a common precision.

### 18.3 Missing data

Missing, delayed and unavailable data are different states.

Never render missing data as zero.

Use explicit states:

- No data
- Loading
- Delayed
- Unavailable
- Error

### 18.4 Chart interaction

Interactive charts must provide:

- keyboard-reachable information
- accessible labels
- hover/focus detail where applicable
- clear selected state
- stable tooltip positioning
- reduced-motion behavior

Sparklines may omit axes, but the surrounding label must provide enough context to interpret the metric.

---

## 19. Content & UX Writing

Content is part of the component contract.

### 19.1 Actions

Use specific verbs.

Prefer:

- Create server
- Save changes
- Restart server
- Copy token
- Reveal secret

Avoid:

- Submit
- Confirm
- Continue

when the actual action can be named.

### 19.2 Destructive actions

Destructive confirmation must identify the object and consequence.

Prefer:

> Delete `Production Server`? This will permanently remove the server configuration.

Avoid:

> Are you sure?

### 19.3 Errors

An error should answer:

1. What happened?
2. What was affected?
3. What can the user do next?

Prefer actionable language:

> Could not restart the server. The control API did not respond. Try again or inspect the connection status.

Avoid generic:

> Something went wrong.

### 19.4 Localization

English and Russian layouts must be validated with realistic strings.

Controls must tolerate Russian expansion without clipping, unexpected wrapping or inaccessible hit targets.

---

## 20. Performance Budget

The visual language is intentionally material and translucent, but performance is a first-class design constraint.

### 20.1 General rules

- Do not animate large blurred surfaces continuously.
- Avoid unnecessary `backdrop-filter` layers.
- Do not stack multiple translucent glass surfaces without a clear hierarchy.
- Prefer opaque fallbacks on constrained devices.
- Avoid continuous 3D/WebGL effects in operational screens.
- Do not use animation to communicate information that can be communicated statically.
- Respect reduced-motion immediately.

### 20.2 Ambient visuals

Ambient 3D effects are primarily for marketing and large visual surfaces.

Operational surfaces such as dashboards, consoles, file browsers and server controls should default to static or extremely low-cost backgrounds.

### 20.3 Blur

Blur-in is reserved for surfaces where the effect materially contributes to hierarchy.

Do not combine large-area animated blur with continuous 3D movement.

### 20.4 Loading

Skeletons must approximate the final content geometry closely enough to avoid avoidable layout shift.

Skeleton animation is disabled or reduced under reduced-motion preferences.

---

## 21. Do / Don't Rules

### 21.1 Glass

**Do**

- use glass to establish material hierarchy
- place glass over a restrained ambient background
- use thicker materials for modal/command surfaces

**Don't**

- stack glass inside glass without a clear hierarchy
- use glass over highly detailed content
- use glass as decoration on every element
- sacrifice text contrast for translucency

### 21.2 Glow

**Do**

- emphasize the primary CTA
- indicate important active/focused states
- use restrained brand emphasis

**Don't**

- glow every button
- glow every card
- use glow as a substitute for state semantics

### 21.3 Color

**Do**

- use semantic tokens
- combine state color with text/icon/shape semantics
- validate both themes

**Don't**

- introduce one-off hex values
- use color alone to communicate status
- mix state colors with unrelated semantic backgrounds

### 21.4 Motion

**Do**

- animate entrance and exit intentionally
- use opacity/position/scale
- provide reduced-motion fallbacks

**Don't**

- bounce controls
- animate operational data continuously without purpose
- attach floating positioning to transformed elements

### 21.5 Density

**Do**

- use compact density for data-heavy operational screens
- preserve 44px touch hit areas
- progressively hide secondary information

**Don't**

- shrink essential text to 11px
- create horizontally overflowing controls
- make every screen equally dense

---

## 22. Implementation Contract

Design and production code must describe the same component.

Every production component should have:

1. anatomy
2. variants
3. sizes
4. states
5. tokens
6. keyboard behavior
7. pointer/touch behavior
8. accessibility contract
9. responsive behavior
10. motion behavior
11. overlay/layer behavior where applicable

### 22.1 DOM semantics

Prefer native semantic elements.

Examples:

- Button → `<button>`
- Link → `<a>`
- Navigation → `<nav>`
- Dialog → dialog semantics
- List → list semantics
- Table → real table semantics

ARIA supplements semantics; it does not replace correct HTML.

### 22.2 Component API

Component APIs should expose intent, not visual implementation details.

Prefer:

```text
variant="primary"
size="md"
loading
disabled
```

over:

```text
background="#6a58f0"
borderOpacity={0.17}
```

### 22.3 Figma/code parity

Figma variables, design tokens and production tokens must share stable names.

A token changed in the design source must have an explicit implementation mapping.

---

## 23. Table System

Tables are a first-class component because administration, monitoring and file-management surfaces depend heavily on them.

### 23.1 Density

| Density | Row height | Use |
|---|---:|---|
| Compact | 32px | dense operational data |
| Default | 40px | general tables |
| Comfortable | 48px | user-facing data |

**Input-modality rule:** Compact density is for fine-pointer/keyboard environments.
On touch-first input, row actions and selection targets must resolve to at least 44px high;
prefer switching the table to Default/Comfortable density rather than overlapping invisible
hit areas between 32px rows.

### 23.2 Behavior

Tables may support:

- sorting
- filtering
- row selection
- bulk actions
- column visibility
- column resizing
- sticky headers
- sticky key columns
- horizontal scrolling
- keyboard navigation
- virtualized rendering for very large datasets

Secondary columns progressively hide based on available container width.

### 23.3 States

A table must distinguish:

- loading
- empty
- filtered-empty
- error
- partial data
- stale data

---

## 24. Typography Usage Rules

The `11px / 14px` Caption Small style is reserved for secondary metadata and dense supporting information.

Never use 11px for:

- primary actions
- essential instructions
- error messages
- required form labels
- critical status information

The `12px / 16px` Caption style is the preferred minimum for readable supporting UI.

Inter alternate glyph configuration is an implementation/font configuration detail and should not be treated as a hard requirement where the rendering environment cannot reliably provide the feature.

---

## 25. Changelog & Governance

This document is the source of truth for the Regi0x visual language.

Changes follow this order:

1. identify the design problem
2. update tokens or component rules
3. update examples/mockups
4. update production implementation
5. record the change in the changelog

New one-off visual values are considered a design-system exception and require explicit justification.

### 25.1 Governance rule

If a mockup conflicts with this document, the mockup is not the source of truth.

Update the system first, then update the mockup.

### 25.2 Changelog format

Latest entry:

```text
2026-08-19
Section: v3 system-wide
Change: Added production handoff, two-theme CSS token contract, exact material values, AI coding-agent rules, QA matrix and role-based quick start; corrected accessibility-sensitive semantic mappings and state/focus rules.
Reason: Make the design system usable as one specification for design, engineering and AI-assisted implementation.
Migration: Adopt companion token files; remove component-local visual literals; validate existing primary/accent text mappings and compact touch tables.
```

Record:

- date
- section
- change
- reason
- migration impact

Example:

```text
2026-08-19
Section: 14 — Design Tokens
Change: Added semantic action tokens.
Reason: Remove direct palette usage from component implementations.
Migration: Replace component-local violet values with color.action.* tokens.
```

---

## 26. Component Definition Template

Every new component should be documented using this structure:

```text
Component name

Purpose
Anatomy
Variants
Sizes
States
Tokens
Interaction
Keyboard
Touch
Accessibility
Responsive behavior
Motion
Overlay/layer behavior
Loading
Empty/error behavior
Do / Don't
Implementation notes
```

A component is not considered complete until its behavior is defined, not merely its appearance.

---

## 27. System Completion Checklist

Before considering a new component production-ready:

- [ ] Uses semantic/component tokens
- [ ] Has defined variants and sizes
- [ ] Has all applicable interaction states
- [ ] Has keyboard behavior
- [ ] Has visible focus-visible behavior
- [ ] Meets 44×44px touch hit target requirements
- [ ] Has accessible naming and semantics
- [ ] Works in dark and light themes
- [ ] Works with Russian localization
- [ ] Works at narrow container widths
- [ ] Handles loading/empty/error states where applicable
- [ ] Respects reduced motion
- [ ] Does not introduce unnecessary blur or continuous animation
- [ ] Does not create unexpected overflow
- [ ] Uses the shared overlay/layer system where applicable
- [ ] Has documented Do / Don't guidance
- [ ] Has Figma/code token parity
- [ ] Has been tested with realistic content

---

## 28. Quick Start by Role

This section is the shortest path into the system. Use it before reading the full reference.

### 28.1 Designer

Before creating a new screen:

1. Use semantic Figma variables; never paste raw palette hex into a component instance.
2. Start from an existing component or documented component anatomy.
3. Design dark and light states together.
4. Validate narrow container behavior, not only desktop viewport behavior.
5. Include rest, hover, focus-visible, pressed, disabled, loading and error states where applicable.
6. Test realistic English and Russian content.
7. Use glass as hierarchy, not decoration.
8. Mark any new visual value as a design-system change before using it in a mockup.

### 28.2 Developer

Before implementing a component:

1. Import `regi0x.tokens.css` once at the application root.
2. Consume semantic or component variables; do not use raw hex/rgb values inside components.
3. Implement native semantics before adding ARIA.
4. Treat focus-visible as an orthogonal state layer.
5. Implement keyboard, touch, reduced-motion and responsive behavior from the component contract.
6. Use the shared overlay root for floating UI.
7. Test both themes and touch/fine-pointer modes.
8. If the spec is missing a value, do not invent a permanent one: raise a design-system decision.

### 28.3 AI coding agent

Before editing UI code:

1. Read `CLAUDE.md`.
2. Read the relevant component section in this document.
3. Inspect `regi0x.tokens.css` / `regi0x.tokens.json` before generating visual values.
4. Search the existing component library before creating a new component.
5. Preserve established variants and APIs unless the task explicitly changes the design system.
6. Never infer a one-off color, radius, z-index, blur, duration or breakpoint.
7. After implementation, verify the QA acceptance matrix in §33.

---

## 29. Production CSS Variables

`regi0x.tokens.css` is the executable token mapping. The design document defines intent;
the CSS file defines the current browser representation. They must change in the same PR/change set.

### 29.1 Usage model

Primitive tokens are theme-independent. Semantic tokens are switched by `data-theme` on
the document root.

```html
<html data-theme="dark">
```

```css
/* Component code consumes meaning, not raw palette values. */
.button-primary {
  min-height: var(--control-md);
  padding-inline: var(--space-4);
  border-radius: var(--radius-sm);
  background: var(--color-action-primary-bg);
  color: var(--color-action-primary-fg);
  box-shadow: var(--shadow-e2), var(--shadow-primary-glow);
  transition:
    background-color var(--motion-duration-normal) var(--ease-standard),
    box-shadow var(--motion-duration-normal) var(--ease-standard),
    transform var(--motion-duration-fast) var(--ease-standard);
}

.button-primary:hover {
  background: var(--color-action-primary-bg-hover);
}

.button-primary:active {
  background: var(--color-action-primary-bg-pressed);
}

.button-primary:focus-visible {
  outline: var(--focus-width) solid var(--color-focus-ring);
  outline-offset: var(--focus-offset);
}
```

### 29.2 Two-theme example

```css
:root,
[data-theme="dark"] {
  --color-bg: #0b0b11;
  --color-text-primary: #f4f4f7;
  --color-surface: rgba(255, 255, 255, 0.045);
  --color-action-primary-bg: #6a58f0;
  --color-action-primary-fg: #ffffff;
  --color-action-link: #a78bfa;
  --color-accent-text: #2dd4bf;
}

[data-theme="light"] {
  --color-bg: #f4f4f8;
  --color-text-primary: #16161f;
  --color-surface: rgba(255, 255, 255, 0.86);
  --color-action-primary-bg: #6247ea;
  --color-action-primary-fg: #ffffff;
  --color-action-link: #6247ea;
  --color-accent-text: #0f766e;
}
```

The full production variable set lives in the companion CSS file.

### 29.3 No raw values inside components

Allowed:

```css
color: var(--color-text-secondary);
gap: var(--space-3);
border-radius: var(--radius-md);
```

Not allowed:

```css
color: #a6a6b8;
gap: 12px;
border-radius: 12px;
```

Raw primitives belong only in the token source, tests/fixtures or explicitly documented exceptions.

---

## 30. Theme Contract

Regi0x ships with two fully designed themes: `dark` and `light`.

### 30.1 Theme ownership

- The product default is `dark`.
- The explicit user choice is persisted.
- Components never contain theme-specific selectors when a semantic token can express the difference.
- Permanently dark surfaces such as Console/Terminal use dedicated fixed-surface tokens and do not invert in light mode.
- `color-scheme` must be set consistently so native browser UI follows the active product theme where appropriate.

### 30.2 Theme switching

The visual circular reveal is progressive enhancement. Theme correctness must not depend on animation.
Under reduced motion, switch semantic values immediately or with a near-instant fade.

### 30.3 Glass fallback

Feature-detect expensive material effects when practical. The documented mobile/tablet threshold remains
a design default, but capability/performance can force the opaque fallback at any width.

### 30.4 Contrast on translucent surfaces

A translucent token does not have one fixed contrast ratio because the composited background changes.
Validate text against representative worst-case backgrounds. If the background is uncontrolled, use an
opaque/elevated material for essential content.

---

## 31. Component Spec Standard — Figma to Code

Every production component has one conceptual identity across Figma, code and documentation.

### 31.1 Required component record

| Field | Design | Code | Why it exists |
|---|---|---|---|
| Name | component set name | exported component | stable identity |
| Purpose | description | doc comment/story | prevents misuse |
| Anatomy | named layers | slots/subcomponents | shared mental model |
| Variants | variant properties | typed props | controlled flexibility |
| Sizes | Figma property | `size` API | density consistency |
| States | state frames | CSS/logic | behavior parity |
| Tokens | variable bindings | CSS vars | no raw values |
| Responsive | component examples | container queries | box-first behavior |
| Accessibility | annotations | semantics/ARIA | testable contract |
| Motion | prototype notes | motion tokens | predictable behavior |
| Maturity | badge | metadata/docs | safe adoption |

### 31.2 Maturity

Every component is one of:

- **Draft** — exploration; not safe for general production use.
- **Beta** — API mostly stable; active validation.
- **Stable** — approved for broad production use.
- **Deprecated** — existing use may remain temporarily; no new adoption.

Record an owner, last review date, Figma reference, code reference and accessibility-test status.

### 31.3 Naming parity

Prefer identical intent words across tools:

```text
Figma: Button / variant=primary / size=md / state=loading
Code:  <Button variant="primary" size="md" loading />
Token: component.button.primary.background
CSS:   --button-primary-background
```

### 31.4 Component exceptions

If a product requirement cannot be represented by an existing variant:

1. decide whether it is a new component, variant or composition;
2. update the design-system contract first;
3. add tokens only if existing semantic meaning is insufficient;
4. update Figma and code in the same change set;
5. record migration impact in the changelog.

---

## 32. AI Coding Agent Contract

This section is written for repository-aware coding agents such as Claude Code.
It is normative whenever an agent changes Regi0x UI code.

### 32.1 Source priority

When sources disagree, use this order and flag the conflict:

1. This design-system specification.
2. `regi0x.tokens.css` and `regi0x.tokens.json` as the current implementation mapping.
3. Stable production components.
4. Figma/mockups.
5. Ad-hoc screenshots or historical code.

A conflicting mockup is not permission to bypass the system.

### 32.2 Agent rules

The agent must:

- reuse an existing component before creating a new one;
- use semantic/component tokens, never arbitrary visual literals;
- implement both themes in the same change;
- preserve focus-visible, keyboard and touch behavior;
- use Lucide for UI icons and official provider assets for brand marks;
- keep sensitive values inside the documented privacy wrappers;
- use the shared overlay root for menus/popovers/dialogs/tooltips;
- use container-responsive behavior for reusable components;
- respect reduced motion;
- preserve Russian localization expansion;
- run the relevant lint/type/test/build checks available in the repository;
- state any design-system gap instead of silently inventing a rule.

The agent must not:

- add a new hex/rgb/hsl value inside a component stylesheet;
- introduce an arbitrary z-index;
- add a new breakpoint for a single component without system review;
- duplicate a component because matching the existing API requires minor adaptation;
- remove native semantics in favor of clickable generic elements;
- implement a tooltip as the only access to essential information;
- use semantic status colors as arbitrary chart-series colors;
- treat Streamer Mode as data protection/security.

### 32.3 Recommended task protocol

For any UI task, the agent should follow:

```text
1. Inspect existing component(s).
2. Read the relevant design-system contract.
3. Inspect semantic/component tokens.
4. Implement the smallest conforming change.
5. Test dark + light.
6. Test keyboard + focus-visible.
7. Test narrow container + touch target behavior.
8. Test realistic English + Russian strings where text changes.
9. Run repository checks.
10. Report any design-system exception explicitly.
```

---

## 33. QA Acceptance Matrix

A component or screen is not done because it visually matches one screenshot.

| Area | Required checks |
|---|---|
| Theme | dark, light, permanently-dark exceptions |
| Interaction | rest, hover, pressed, focus-visible, disabled, loading |
| Keyboard | reachability, activation, escape/close, focus restoration where relevant |
| Touch | minimum 44×44 targets; no overlapping hit regions |
| Responsive | narrow container, page breakpoint behavior, overflow |
| Localization | realistic English and Russian strings |
| Content | empty, long, malformed, delayed, unavailable and error data as applicable |
| Accessibility | semantic role/name/state, contrast, non-color cues, reduced motion |
| Overlay | collision/flip/shift, viewport gutter, stacking, focus ownership |
| Performance | no unnecessary large blur/3D/continuous animation |
| Privacy | masked values, copy behavior, streamer mode, logs/export where applicable |
| Code quality | no raw visual literals, stable API, tests/checks pass |

### 33.1 Visual regression reference states

For stable components, maintain representative regression states rather than screenshotting every combination:

- dark/rest
- dark/focus-visible
- light/rest
- light/error or selected state
- narrow container
- long Russian content
- reduced-motion or animation-disabled state where motion materially affects layout

---

## 34. Repository & Delivery Structure

Recommended project organization:

```text
/
├── CLAUDE.md
├── docs/
│   └── design-system/
│       ├── REGI0X_DESIGN_SYSTEM_v3.md
│       └── changelog.md                 # optional split when history grows
├── src/
│   ├── styles/
│   │   └── regi0x.tokens.css
│   ├── design-tokens/
│   │   └── regi0x.tokens.json
│   └── components/
│       ├── Button/
│       ├── Field/
│       ├── Modal/
│       └── ...
└── tests/
    └── ui/
```

If the repository uses a different structure, preserve its conventions; the important contract is that the
specification, executable tokens and components remain easy to discover and change together.

### 34.1 Definition of source of truth

- **Meaning and product rule:** this document.
- **Executable values:** token files generated/maintained from the same approved decisions.
- **Visual authoring:** Figma variables/components mapped to the same stable names.
- **Implementation:** production components consuming semantic/component tokens.
- **AI instructions:** concise `CLAUDE.md` pointing to these sources rather than duplicating the entire system.

---

*Regi0x Design System is a living product contract. Change the system before introducing a visual exception;
update design, tokens and implementation together; record the reason and migration impact.*

