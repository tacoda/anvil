# /debug-runtime

Systematically debug runtime issues using a browser DevTools MCP.

Prerequisites: dev server running; a DevTools/browser MCP configured (see
`.claude/settings.mcp.json.template`).

## Steps

1. Take a screenshot of the current page state.
2. Check the browser console for errors or warnings.
3. Inspect network requests for failed or slow responses.
4. If performance issues are suspected, run a performance trace.
5. For each issue found:
   - Identify the root cause in the source code.
   - Propose a fix.
   - Implement the fix.
   - Verify with another screenshot / console check.

## Report Format

- **Issue**: [what's wrong]
- **Root cause**: [why it happens]
- **Fix**: [what you changed]
- **Verified**: [how you confirmed the fix]
