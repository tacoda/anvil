# Adopting Anvil Incrementally

You don't set up the whole library at once. Small, consistent investment
compounds — a single well-crafted skill saves time on every project that uses
it. Start with the pieces that match your current work; add the rest as the need
appears.

## A suggested cadence

```
Week 1   → Save your best spec as a template          (SPEC.md.template)
Week 2   → Write one skill for your most common task   (.claude/skills/)
Week 3   → Turn one repeated prompt into a command     (.claude/commands/)
Week 4   → Set up one MCP server for a daily tool      (.claude/settings.mcp.json.template)
Month 2  → Create a subagent for a domain you work in  (.claude/agents/)
Month 3  → Share your best templates with your team
```

Nothing here is load-bearing order — it's a low-pressure ramp. Skip a rung if
your work doesn't need it yet; jump ahead if it does.

## How to choose what's next

- Which AI pattern fits the task in front of you? → `docs/DECISION_FRAMEWORK.md`
- Which patterns have actually paid off for you? → `.claude/pattern-log.md`
  (fed by `/retro`). Let the log, not this cadence, drive what you invest in.

## The rule of thumb

Promote something to a template the moment you've done it well twice. The first
time proves it works; the second proves it repeats. That's the signal to save
it — as a spec, a skill, a command, or an agent — so future-you starts from it
instead of rebuilding it.
