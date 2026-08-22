#!/usr/bin/env bash
set -euo pipefail
PROFILE="core"
SCOPE="project"
while [ $# -gt 0 ]; do
  case "$1" in
    --profile) PROFILE="$2"; shift 2;;
    --scope) SCOPE="$2"; shift 2;;
    -h|--help)
      cat <<'EOF'
Usage: install-external-skills.sh [--profile core|visual|all] [--scope project|user]
core   = Go plugin + project HTMX skill
visual = WebGPU skill + GSAP skills
all    = core + visual
Review third-party SKILL.md files before trusting a workspace.
EOF
      exit 0;;
    *) echo "Unknown option: $1" >&2; exit 2;;
  esac
done

install_go(){
  command -v claude >/dev/null 2>&1 || { echo 'Claude CLI required for Go plugin install' >&2; return 1; }
  # Marketplace command availability can vary by Claude Code version; try CLI marketplace syntax, otherwise print interactive fallback.
  if claude plugin marketplace add samber/cc >/dev/null 2>&1; then
    claude plugin install cc-skills-golang@samber --scope "$SCOPE" || true
  else
    echo 'Run in Claude Code: /plugin marketplace add samber/cc'
    echo 'Then: /plugin install cc-skills-golang@samber'
  fi
}
install_htmx(){
  local dest
  if [ "$SCOPE" = user ]; then dest="$HOME/.claude/skills/htmx"; else dest=".claude/skills/htmx"; fi
  local tmp; tmp="$(mktemp -d)"
  git clone --depth 1 https://github.com/mintarasss/htmx-skill.git "$tmp/htmx-skill"
  mkdir -p "$(dirname "$dest")"; rm -rf "$dest"; cp -a "$tmp/htmx-skill/htmx" "$dest"; rm -rf "$tmp"
  echo "Installed htmx skill -> $dest"
}
install_webgpu(){
  local dest
  if [ "$SCOPE" = user ]; then dest="$HOME/.claude/skills/webgpu-threejs-tsl"; else dest=".claude/skills/webgpu-threejs-tsl"; fi
  local tmp; tmp="$(mktemp -d)"
  git clone --depth 1 https://github.com/dgreenheck/webgpu-claude-skill.git "$tmp/webgpu"
  mkdir -p "$(dirname "$dest")"; rm -rf "$dest"; cp -a "$tmp/webgpu/skills/webgpu-threejs-tsl" "$dest"; rm -rf "$tmp"
  echo "Installed WebGPU skill -> $dest"
}
install_gsap(){
  local base
  if [ "$SCOPE" = user ]; then base="$HOME/.claude/skills"; else base=".claude/skills"; fi
  local tmp; tmp="$(mktemp -d)"
  git clone --depth 1 https://github.com/greensock/gsap-skills.git "$tmp/gsap"
  mkdir -p "$base"
  for skill in "$tmp/gsap"/skills/*; do
    [ -f "$skill/SKILL.md" ] || continue
    name="$(basename "$skill")"
    rm -rf "$base/$name"
    cp -a "$skill" "$base/$name"
  done
  rm -rf "$tmp"
  echo "Installed GSAP skills -> $base"
}

case "$PROFILE" in
  core) install_go; install_htmx;;
  visual) install_webgpu; install_gsap;;
  all) install_go; install_htmx; install_webgpu; install_gsap;;
  *) echo 'Unknown profile' >&2; exit 2;;
esac

echo 'Restart Claude Code or use /reload-plugins where applicable.'
