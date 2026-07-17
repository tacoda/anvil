# /ux-audit

Run an automated UX audit on the running application using a browser DevTools MCP.

Prerequisites: dev server running; DevTools/browser MCP configured.

## Steps

1. **Page inventory**: Screenshot each key page ([home, list, detail, create
   form]). Log console errors on each navigation.

2. **Interactive element check**: On each page, click every button, link, and
   input; verify it produces the expected response. Report anything unresponsive
   or erroring.

3. **Responsive layout check**: Resize to three breakpoints and screenshot each:
   - Desktop (1280px)
   - Tablet (768px)
   - Mobile (375px)
   Flag overlapping elements, text overflow, unreachable buttons, horizontal scroll.

4. **Loading and error states**: Navigate with simulated slow network; verify
   loading indicators. Submit invalid data; verify error messages are clear and
   actionable.

5. **Performance check**: Run a performance trace on the heaviest page. Flag long
   tasks (>50ms), layout thrashing, excessive re-renders.

6. **Report**:
   - PASS: [what looks good]
   - WARN: [minor issues worth addressing]
   - FAIL: [issues that must be fixed before shipping]

Fix FAIL issues automatically. For WARN issues, describe the fix and leave the
decision to the developer.
