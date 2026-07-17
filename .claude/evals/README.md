# Evals

Behavioral tests for the `.claude` setup. Static checks ask *is a rule
well-formed?* Evals ask the harder question: *does a rule actually change what
the agent produces?*

## Layout

```
.claude/evals/
  README.md          # this file
  cases/<slug>.md    # one eval case per file — probe + expect + reject + check
  RESULTS.md         # append-only run log: date · slug · PASS/FAIL · why
```

## Case format

Each case in `cases/` has frontmatter naming the rule under test, then four
sections:

- **Probe** — a realistic task with no hint of the rule.
- **Expect** — the compliant signal.
- **Reject** — the violation signal.
- **Check** — the deterministic assertion (what a script or reviewer verifies).

See `cases/CASE.md.template` for the scaffold.

## The rule for a good eval

The Probe must be able to *fail* — a task where an unguided agent would naturally
do the wrong thing. Run the subject agent blind to the rule:

- Complies anyway → the rule is landing.
- Violates → the rule isn't reaching that path. Fix the rule, not the eval.

Eval the rules that carry weight: iron laws and high-risk paths (security,
data, money). Preferences rarely earn an eval.
