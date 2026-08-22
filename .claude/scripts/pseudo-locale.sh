#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: check/pseudo-locale.sh INPUT.json OUTPUT.json

Creates a development-only pseudo locale by wrapping every string and adding
roughly 35% padding. Placeholders remain untouched inside the original text.
Do not ship the generated catalog as a production locale.
USAGE
}

if [[ ${1:-} == "-h" || ${1:-} == "--help" ]]; then usage; exit 0; fi
if [[ $# -ne 2 ]]; then usage >&2; exit 2; fi

INPUT=$1
OUTPUT=$2
command -v jq >/dev/null || { echo "jq is required" >&2; exit 1; }
[[ -f "$INPUT" ]] || { echo "Missing catalog: $INPUT" >&2; exit 1; }
jq -e 'type == "object"' "$INPUT" >/dev/null

jq '
  walk(
    if type == "string" then
      . as $s
      | ((($s | length) * 0.35) | ceil) as $extra
      | "⟦!! " + $s + " " + ("~" * $extra) + " !!⟧"
    else . end
  )
' "$INPUT" > "$OUTPUT"

echo "pseudo locale written: $OUTPUT"
