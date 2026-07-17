---
description: Test requirements for new code — a test file per new file, cover happy/edge/error paths, 80% minimum.
paths:
  - "src/**"
layer: project
locked: false
why: Untested code added under time pressure becomes the regression surface later; requiring the test with the code keeps coverage from eroding.
---

# Testing

## Rules

- Every new source file gets a corresponding test file.
- Cover the happy path, edge cases, and error cases — not just the happy path.
- Use `describe` / `it` blocks with clear, behavior-describing names.
- Minimum 80% line coverage for new code.

## Examples

```ts
// Good: named by behavior, covers success + failure
describe("paginate", () => {
  it("returns the first page with a next cursor", () => { /* ... */ });
  it("returns hasMore: false on the last page", () => { /* ... */ });
  it("handles an empty dataset without throwing", () => { /* ... */ });
});
```
