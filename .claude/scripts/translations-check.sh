#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: check/translations.sh EN.json RU.json

Checks that both JSON catalogs are valid, non-empty and contain the same
stable top-level message keys. Plural subkeys may differ because languages
have different CLDR plural categories.
USAGE
}

if [[ ${1:-} == "-h" || ${1:-} == "--help" ]]; then usage; exit 0; fi
if [[ $# -ne 2 ]]; then usage >&2; exit 2; fi

EN=$1
RU=$2
command -v jq >/dev/null || { echo "jq is required" >&2; exit 1; }
[[ -f "$EN" ]] || { echo "Missing catalog: $EN" >&2; exit 1; }
[[ -f "$RU" ]] || { echo "Missing catalog: $RU" >&2; exit 1; }

jq -e 'type == "object" and length > 0' "$EN" >/dev/null
jq -e 'type == "object" and length > 0' "$RU" >/dev/null

TMP_EN=$(mktemp)
TMP_RU=$(mktemp)
trap 'rm -f "$TMP_EN" "$TMP_RU"' EXIT
jq -r 'keys[]' "$EN" | LC_ALL=C sort > "$TMP_EN"
jq -r 'keys[]' "$RU" | LC_ALL=C sort > "$TMP_RU"

if ! diff -u "$TMP_EN" "$TMP_RU"; then
  echo >&2
  echo "Translation catalogs do not contain the same message keys." >&2
  exit 1
fi

for catalog in "$EN" "$RU"; do
  if jq -e '[to_entries[] | select((.value|type)=="string" and (.value|length)==0)] | length > 0' "$catalog" >/dev/null; then
    echo "Catalog contains empty string values: $catalog" >&2
    exit 1
  fi
done

echo "translation catalogs ok: $(wc -l < "$TMP_EN") keys"
