#!/usr/bin/env bash
set -euo pipefail
# Re-running the installer is intentionally the update mechanism for copied project skills.
# Go plugin updates through Claude Code's plugin manager.
SCOPE="${1:-project}"
if command -v claude >/dev/null 2>&1; then
  claude plugin update cc-skills-golang@samber --scope "$SCOPE" -y 2>/dev/null || true
fi
bash "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/install-external-skills.sh" --profile all --scope "$SCOPE"
