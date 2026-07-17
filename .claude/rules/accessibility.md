---
description: Accessibility requirements for React components — semantic HTML, ARIA, keyboard nav, focus.
paths:
  - "src/**/*.tsx"
  - "src/**/*.jsx"
layer: project
locked: false
why: Inaccessible UI ships silently and is expensive to retrofit; these are the baseline WCAG affordances a reviewer keeps re-requesting.
---

# Accessibility

## Rules

- Always use semantic HTML elements (`<button>`, `<nav>`, `<label>`) over `<div>` with handlers.
- Add ARIA labels to interactive elements that lack a visible text label.
- Ensure every interactive element is keyboard-navigable and operable.
- Never remove focus outlines without providing a visible replacement.

## Examples

```tsx
// Good: semantic, labeled, keyboard-operable
<button aria-label="Close dialog" onClick={onClose}>×</button>
```

```tsx
// Bad: div-as-button, no keyboard support, no label
<div className="btn" onClick={onClose}>×</div>
```
