#!/usr/bin/env bash
set -euo pipefail
TARGET="$(pwd)"
REPO=""
REF="main"
PROFILE=""
while [ $# -gt 0 ]; do
  case "$1" in
    --target) TARGET="$2"; shift 2;;
    --repo) REPO="$2"; shift 2;;
    --ref) REF="$2"; shift 2;;
    --profile) PROFILE="$2"; shift 2;;
    -h|--help) echo 'Usage: update.sh [--target PATH] [--repo URL] [--ref branch-or-tag] [--profile generic|regi0x-blog|regi0x-ui-lab|regi0x-status|fidonyaa-platform]'; exit 0;;
    *) echo "Unknown option: $1" >&2; exit 2;;
  esac
done
TARGET="$(cd "$TARGET" && pwd)"
if [ -z "$REPO" ] && [ -f "$TARGET/.claude/regi0x/source-url" ]; then REPO="$(cat "$TARGET/.claude/regi0x/source-url")"; fi
if [ -z "$PROFILE" ] && [ -f "$TARGET/.claude/regi0x/profile" ]; then PROFILE="$(tr -d '\r\n' < "$TARGET/.claude/regi0x/profile")"; fi
[ -n "$PROFILE" ] || PROFILE="generic"
if [ -z "$REPO" ]; then echo 'No source repo. Pass --repo URL or reinstall once with --source-url.' >&2; exit 2; fi
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
git clone --depth 1 --branch "$REF" "$REPO" "$TMP/kit"
bash "$TMP/kit/scripts/install.sh" --target "$TARGET" --source-url "$REPO" --profile "$PROFILE"
