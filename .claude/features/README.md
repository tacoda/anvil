# Feature Documentation

On-demand context for agents working in a specific feature or domain.

These docs are **not** auto-loaded. The agent reads one when exploring the
relevant area before making a change. Each captures the irreducible context —
entities, endpoints, gotchas — that an agent would otherwise reinvent.

## When to add a doc

- A feature has been touched twice and the agent reinvented the same context both times.
- A domain has non-obvious invariants not captured by code or a rule.
- New contributors (human or AI) need a head start on the area.

## Conventions

- Keep each doc under ~60 lines. Growing past that? The feature probably needs splitting.
- Cite real files and real entry points. Speculation is worse than nothing.
- Domain terms link to `GLOSSARY.md`; don't redefine.

Copy `FEATURE.md.template` to `<feature-name>.md` and fill it in.
