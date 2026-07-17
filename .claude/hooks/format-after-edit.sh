#!/usr/bin/env bash
# PostToolUse hook: format a file right after Claude edits/writes it.
#
# The harness passes the tool call as JSON on stdin. We pull the edited file
# path out and run the project formatter on it. Exit 0 always — a formatter
# failure should not block the edit.
#
# Wire it up via the PostToolUse "Edit|Write" matcher (see
# settings.hooks.json.template).

set -uo pipefail

payload="$(cat)"

# Extract the file path from the tool input. Requires jq.
file="$(printf '%s' "$payload" | jq -r '.tool_input.file_path // empty')"

[[ -z "$file" || ! -f "$file" ]] && exit 0

case "$file" in
  # --- Customize per project ---------------------------------------------
  *.ts|*.tsx|*.js|*.jsx|*.json|*.css|*.md)
    npx prettier --write "$file" >/dev/null 2>&1 || true
    ;;
  *.py)
    ruff format "$file" >/dev/null 2>&1 || true
    ;;
  *.go)
    gofmt -w "$file" >/dev/null 2>&1 || true
    ;;
  # -----------------------------------------------------------------------
esac

exit 0
