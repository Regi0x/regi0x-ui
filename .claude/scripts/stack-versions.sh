#!/usr/bin/env bash
set -u

printf 'Regi0x stack context\n'
printf 'cwd: %s\n' "$(pwd)"
printf 'git: %s\n' "$(git rev-parse --short HEAD 2>/dev/null || echo not-a-git-repo)"
printf '\n[Go]\n'
if command -v go >/dev/null 2>&1; then GOTOOLCHAIN=local go version 2>&1 || true; else echo 'go: not installed'; fi
if [ -f go.mod ]; then
  awk '/^go /{print "go.mod directive: "$2} /^toolchain /{print "go.mod toolchain: "$2}' go.mod
  if command -v go >/dev/null 2>&1; then
    GOTOOLCHAIN=local go list -m github.com/a-h/templ 2>/dev/null | sed 's/^/templ module: /' || true
  fi
else
  echo 'go.mod: not found'
fi
command -v templ >/dev/null 2>&1 && (templ version 2>/dev/null || templ --version 2>/dev/null || true) | sed 's/^/templ CLI: /' || echo 'templ CLI: not installed'

printf '\n[JavaScript]\n'
command -v node >/dev/null 2>&1 && node --version | sed 's/^/node: /' || echo 'node: not installed'
for pm in npm pnpm bun yarn; do
  if command -v "$pm" >/dev/null 2>&1; then
    "$pm" --version 2>/dev/null | head -1 | sed "s/^/$pm: /"
  fi
done

if [ -f package.json ] && command -v node >/dev/null 2>&1; then
  node <<'NODE'
const fs=require('fs');
const p=JSON.parse(fs.readFileSync('package.json','utf8'));
console.log('packageManager:', p.packageManager || 'not declared');
const names=['htmx.org','tailwindcss','@tailwindcss/cli','chart.js','three','svelte','gsap'];
for (const n of names) {
  const spec=(p.dependencies&&p.dependencies[n])||(p.devDependencies&&p.devDependencies[n]);
  if (spec) console.log(`declared ${n}: ${spec}`);
  try {
    const q=`node_modules/${n}/package.json`;
    if (fs.existsSync(q)) {
      const v=JSON.parse(fs.readFileSync(q,'utf8')).version;
      console.log(`installed ${n}: ${v}`);
    }
  } catch (_) {}
}
NODE
else
  echo 'package.json/node: unavailable'
fi

printf '\n[Tooling]\n'
command -v task >/dev/null 2>&1 && task --version | head -1 | sed 's/^/task: /' || echo 'task: not installed'
command -v caddy >/dev/null 2>&1 && caddy version | head -1 | sed 's/^/caddy: /' || echo 'caddy: not installed'

printf '\n[Lockfiles]\n'
for f in go.sum package-lock.json pnpm-lock.yaml bun.lock bun.lockb yarn.lock; do
  [ -f "$f" ] && echo "$f: present"
done
