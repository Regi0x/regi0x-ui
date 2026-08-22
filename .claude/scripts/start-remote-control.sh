#!/usr/bin/env bash
set -euo pipefail

NAME="${1:-$(basename "$PWD")}" 
MODE="${2:-session}"
TMUX_NAME="claude-${NAME,,}"
TMUX_NAME="${TMUX_NAME//[^a-z0-9_-]/-}"

command -v claude >/dev/null || { echo "claude not found" >&2; exit 1; }
command -v tmux >/dev/null || { echo "tmux not found; install tmux or run claude remote-control directly" >&2; exit 1; }
[ -d .git ] || echo "Warning: current directory is not a Git repository." >&2

printf -v QNAME '%q' "$NAME"
case "$MODE" in
  session)
    CMD="exec claude remote-control --name $QNAME --spawn session"
    ;;
  worktree)
    [ -d .git ] || { echo "worktree mode requires a Git repository" >&2; exit 1; }
    CMD="exec claude remote-control --name $QNAME --spawn worktree --capacity 3"
    ;;
  *) echo "Usage: $0 [NAME] [session|worktree]" >&2; exit 2;;
esac

if tmux has-session -t "$TMUX_NAME" 2>/dev/null; then
  echo "tmux session already exists: $TMUX_NAME"
  echo "Attach with: tmux attach -t $TMUX_NAME"
  exit 0
fi

PROJECT_DIR="$PWD"
tmux new-session -d -s "$TMUX_NAME" "cd $(printf '%q' "$PROJECT_DIR") && $CMD"
echo "Started Remote Control in tmux: $TMUX_NAME"
echo "Attach: tmux attach -t $TMUX_NAME"
echo "Then open Claude mobile app -> Code and select '$NAME'."
