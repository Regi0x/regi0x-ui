#!/usr/bin/env bash
set -euo pipefail

OWNER="${1:-}"
if [ -z "$OWNER" ] || ! [[ "$OWNER" =~ ^[A-Za-z0-9-]+$ ]]; then
  echo "Usage: $0 <github-owner>" >&2
  echo "github-owner may contain letters, numbers and hyphens" >&2
  exit 2
fi

OLD='regi0x.dev/ui'
NEW="github.com/${OWNER}/regi0x-ui"

while IFS= read -r -d '' file; do
  sed -i "s|${OLD}|${NEW}|g" "$file"
done < <(find . \
  -path './.git' -prune -o \
  -path './node_modules' -prune -o \
  -type f \( -name '*.go' -o -name '*.templ' -o -name '*.md' -o -name '*.yml' -o -name '*.yaml' -o -name '*.json' -o -name 'go.mod' \) \
  -print0)

echo "Configured Go module: $NEW"
echo "Run: templ generate && go mod tidy && task check"
