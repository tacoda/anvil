# /review

Review the current git diff (or the whole project) for code quality issues.

## Steps

1. Read the changed files (`git diff`), or all source files in `[src/]` for a full review.
2. Check for **security issues**: hardcoded secrets, unsanitized input, injection
   risks, missing auth checks, exposed error details.
3. Check for **performance issues**: N+1 queries, missing indexes, unbounded
   loops, missing memoization/caching, large bundle increases.
4. Check for **error handling gaps**: unhandled rejections, missing try/catch,
   no null/undefined checks, missing timeouts.
5. Check for **test coverage gaps**: new functions without tests, untested error
   paths, uncovered edge cases.
6. Output a structured summary:

```
## Code Review Summary

### Security
| Severity | File | Issue | Suggestion |
|----------|------|-------|------------|

### Performance
| Severity | File | Issue | Suggestion |
|----------|------|-------|------------|

### Error Handling / Tests
| Severity | File | Issue | Suggestion |
|----------|------|-------|------------|

### Overall: SAFE TO MERGE / RECOMMEND CHANGES
```

## Notes

- Severity levels: CRITICAL, HIGH, MEDIUM, LOW.
- If no issues in a category, say "No issues found".
- Be specific about file paths and line numbers.
- For each finding: what's wrong, why it matters, suggested fix.
