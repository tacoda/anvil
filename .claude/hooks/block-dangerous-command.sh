#!/usr/bin/env bash
# PreToolUse hook: block dangerous shell commands before they run.
#
# The harness passes the tool call as JSON on stdin. Exit code 2 blocks the
# tool call and feeds stderr back to Claude as the reason. Exit 0 allows it.
#
# This is defense in depth alongside the permissions "deny" list — it catches
# patterns that are hard to express as exact permission rules.
#
# Wire it up via the PreToolUse "Bash" matcher (see settings.hooks.json.template).

set -uo pipefail

payload="$(cat)"
cmd="$(printf '%s' "$payload" | jq -r '.tool_input.command // empty')"

# --- Deny patterns — customize per project ---------------------------------
deny_patterns=(
  'rm -rf /'
  'rm -rf ~'
  'rm -rf \*'
  ':(){:|:&};:'          # fork bomb
  'git reset --hard'
  'git clean -fd'
  'git push --force'
  'git push -f'
  '> /dev/sd'            # writing to raw disks
  'mkfs'
  'dd if='
)
# ---------------------------------------------------------------------------

for pat in "${deny_patterns[@]}"; do
  if printf '%s' "$cmd" | grep -qE "$pat"; then
    echo "Blocked by block-dangerous-command hook: command matches denied pattern '$pat'." >&2
    exit 2
  fi
done

exit 0
