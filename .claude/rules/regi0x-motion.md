---
paths:
  - "**/*.templ"
  - "**/*.html"
  - "**/*.svelte"
  - "web/**/*.{css,js,ts}"
  - "apps/**/*.{css,js,ts,svelte}"
---
# Motion and interaction quality

Regi0x motion should feel calm, immediate and deliberate. Smoothness comes from consistency and responsiveness, not from animating everything.

## Use the motion system

- Consume the Design System motion tokens; do not invent arbitrary durations/easings in individual components.
- Typical interaction hierarchy: fast for press/focus feedback, normal for control state changes, medium/slow for overlays and larger view changes, ambient only for low-priority background motion.
- Entrance motion uses opacity plus a small transform/scale at most. Avoid large travel distances and bouncy overshoot.
- Initial content must remain usable if animation never runs. Never hide critical content behind an entrance sequence.

## Performance

- Prefer animating `transform` and `opacity`.
- Avoid repeatedly animating layout-affecting properties such as `width`, `height`, `top`, `left`, large shadows or expensive blur/backdrop-filter surfaces.
- Do not continuously animate large blurred backgrounds. Ambient effects must be slow, subtle, off the critical path and paused/removed when not visible where practical.
- Do not add a JS animation library for a button, menu, modal or ordinary page transition that CSS/View Transitions already handles cleanly.
- GSAP is reserved for choreography that CSS/Three cannot express cleanly; Three/WebGPU is not a substitute for normal UI motion.

## Interaction behavior

- Press feedback should be subtle and immediate; avoid exaggerated scaling.
- Hover-only motion/effects apply only where hover exists; the mobile experience must not depend on hover.
- Focus state is immediate and must never wait for an animation.
- Loading motion communicates progress; it must not become decorative noise.
- Do not animate every card on every page load. Choreograph only important hierarchy changes.

## Page and htmx transitions

- Prefer progressive enhancement with the browser View Transition API for meaningful same-origin page/state changes when supported.
- htmx swaps may opt into `transition:true` when the swap benefits from continuity and focus/history behavior remains correct.
- Do not enable global view transitions blindly across a mature application; start with intentional routes/swaps and expand after testing.
- A non-supporting browser must receive the same correct state change without animation.
- Preserve scroll, focus, history and live-region behavior across transitions. Visual continuity never outranks navigation correctness.

## Reduced motion

`prefers-reduced-motion: reduce` is a hard contract.

- Remove spatial travel, scale choreography, parallax and ambient drift.
- Use immediate state changes or a near-instant opacity change where feedback is still useful.
- Disable/reduce shimmer and nonessential looping effects.
- Never require motion to understand status, hierarchy or completion.

## Review gate

For important UI changes, check normal and reduced-motion modes on a narrow and desktop viewport. If motion feels slow under repeated use, simplify it before increasing duration or adding effects.
