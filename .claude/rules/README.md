# Rules

Path-scoped instructions Claude Code auto-loads when matching files are touched.
One concern per file. Keep the every-session set (`paths: ["**"]`) small — each
one costs tokens on every turn.

## Frontmatter schema

Every rule file under `.claude/rules/*.md` carries this YAML frontmatter:

```yaml
---
description: <one-line summary shown in the rule index — keep under ~120 chars>
paths:
  - "<glob>"      # paths that trigger this rule to auto-load ("**" = every session)
  - "<glob>"
layer: project | team | personal   # where the rule belongs (see litmus below)
locked: true | false               # true = iron law; an override should surface as a deviation
why: <one-line: the incident or principle the rule prevents>
---
```

- **`description`** — what the rule covers. Shown in the index.
- **`paths`** — globs matched against the touched-file set. Be specific; `**`
  loads every session.
- **`layer`** — placement per the litmus test below.
- **`locked`** — `true` for rules whose override you want to see, not silently absorb.
- **`why`** — motivation. A rule without a WHY teaches the letter, not the spirit;
  on the first edge case the agent guesses.

## Litmus for placement

Stop at the first clean answer:

1. Strip the rule to one sentence. Can't? Split it.
2. Names a language/framework/library? → no higher than `project`.
3. Survives a tech-stack change? No → `project`. Yes → continue.
4. Survives a process change (Scrum→Kanban, Jira→Linear)? No → `team`. Yes → `personal`.
5. Within `project`: still applies if you deleted half the repo? No → scope
   `paths:` to the subdirectory it governs.

## When to add a rule

- The agent made the same mistake twice.
- A convention exists only in someone's head or in review comments.
- A path has a non-obvious invariant (security, data, ordering).

Copy `RULE.md.template` to `<rule-name>.md` and fill it in.
