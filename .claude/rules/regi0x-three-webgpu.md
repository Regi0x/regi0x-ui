---
paths:
  - "**/visuals/**/*.{js,ts,svelte,wgsl}"
  - "**/three/**/*.{js,ts,svelte,wgsl}"
  - "**/*webgpu*.{js,ts,svelte,wgsl}"
  - "**/*three*.{js,ts,svelte}"
---
# Three.js / WebGPU

- Three.js/WebGPU is progressive enhancement for 3D, hero and specialist visual scenes; operational UI must remain usable without it.
- Use the exact installed Three.js version and official migration/docs for version-sensitive WebGPU/TSL APIs.
- Lazy-load heavy scenes; avoid shipping 3D code on routes that do not use it.
- Provide a static/low-cost fallback and honor reduced motion.
- Pause or reduce rendering when offscreen/hidden; clean up RAF loops, GPU resources, textures, geometries, materials and observers.
- Do not stack continuous 3D motion with large animated backdrop blurs.
- Use GSAP only for choreography that CSS/Three's own animation mechanisms do not express cleanly.
- WebGPU failure/device loss must degrade gracefully rather than break the page.
