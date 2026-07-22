# Anvil — AI-Assisted Development Templates

A copy-and-fill template library for setting up AI-assisted development in any
project. Extracted and generalized from working demos.

Copy the pieces you need into your project, then fill in the `[BRACKETS]`.

New here? **[`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md)** shows how all the
pieces fit together in five diagrams.

## What's here

```
anvil/
├── CLAUDE.md.template          # Project constitution (permanent context)
├── SPEC.md.template            # Feature blueprint (what to build now)
├── PROMPT.md.template          # One-shot / vibe-coding prompt
├── GLOSSARY.md.template        # Shared domain vocabulary
├── GOVERNANCE.md.template      # Project governance (roles, decisions, maintainers)
├── CONTRIBUTING.md.template    # How to build, test, and submit changes
├── CODE_OF_CONDUCT.md.template # Community standards + enforcement
├── SECURITY.md.template        # Vulnerability reporting policy
├── AGENTS.md.template          # Cross-tool instructions for AI agents
│
├── .claude/
│   ├── INDEX.json.template             # Manifest of .claude artifacts
│   ├── MEMORY.md.template              # Durable cross-session project memory
│   ├── debt-ledger.md.template         # Tracked, prioritized debt
│   ├── pattern-log.md.template         # Which AI patterns work, session over session
│   ├── settings.json.template          # Model, permissions, context config
│   ├── settings.mcp.json.template      # MCP server registration
│   ├── settings.hooks.json.template    # Hook wiring (auto-lint, guards)
│   ├── commands/                       # Slash commands (ready to use)
│   │   ├── verify.md                   # /verify — test + lint + summarize
│   │   ├── review.md                   # /review — structured code review
│   │   ├── scaffold.md                 # /scaffold — generate feature module
│   │   ├── test-coverage.md            # /test-coverage — fill coverage gaps
│   │   ├── debug-runtime.md            # /debug-runtime — DevTools debugging
│   │   ├── ux-audit.md                 # /ux-audit — automated UX audit
│   │   ├── retro.md                    # /retro — session retrospective
│   │   └── evaluate.md                 # /evaluate — pick an AI pattern
│   ├── skills/
│   │   └── SKILL.md.template           # Skill scaffold (dir + frontmatter)
│   ├── agents/
│   │   └── AGENT.md.template           # Subagent scaffold
│   ├── rules/                          # Path-scoped auto-loaded rules
│   │   ├── README.md                   # Frontmatter schema + placement litmus
│   │   └── RULE.md.template            # Rule scaffold
│   ├── features/                       # On-demand domain context docs
│   │   ├── README.md                   # When/how to add a feature doc
│   │   └── FEATURE.md.template         # Feature doc scaffold
│   ├── plans/
│   │   └── PLAN.md.template            # Standalone bounded plan
│   ├── evals/                          # Behavioral tests for rules
│   │   ├── README.md                   # Case format + what makes a good eval
│   │   ├── RESULTS.md                  # Append-only run log
│   │   └── cases/CASE.md.template      # probe/expect/reject/check scaffold
│   └── hooks/
│       ├── format-after-edit.sh        # PostToolUse formatter
│       └── block-dangerous-command.sh  # PreToolUse guard
│
├── orchestration/
│   ├── orchestrate.md.template         # Parent-agent delegation script
│   ├── TASKS.md.template               # Parallel swarm task board
│   ├── migration-plan.md.template      # Multi-phase refactor plan
│   └── ralph/                          # Autonomous agent loop
│       ├── ralph.sh                    # The loop runner
│       ├── CLAUDE.md.template          # Per-iteration agent prompt
│       ├── prd.json.template           # User stories with pass/fail
│       └── progress.txt                # Append-only learnings log
│
├── docs/
│   ├── ARCHITECTURE.md                 # How the pieces fit (mermaid diagrams)
│   ├── DECISION_FRAMEWORK.md           # Which AI pattern for which task
│   ├── ADOPTION.md                     # Incremental rollout cadence
│   ├── SKILL_AUTHORING_GUIDE.md        # How to write skills
│   └── ADR.md.template                 # Architecture decision record
│
└── examples/                           # Filled-in reference instances
    ├── skills/                         # frontend-design, api-design, pptx
    ├── agents/                         # data-layer, business-logic, api-layer
    ├── rules/                          # accessibility, testing
    ├── orchestration/                  # invitation-service orchestrator script
    ├── plans/                          # Multi-phase migration plan
    ├── specs/                          # Real SPEC instances
    ├── prompts/                        # Real vibe-coding prompts
    └── mcp-server/                     # A working custom MCP server (TS)
```

All concrete, filled-in examples live under `examples/`. Everything under
`.claude/` is a blank scaffold (`*.template`) or a shape-defining `README.md`.

## The two-file mental model

- **CLAUDE.md** — *How we work here.* Read automatically every session. Tech
  stack, conventions, commands, architecture rules. Permanent.
- **SPEC.md** — *What we're building right now.* One feature's requirements,
  UI/UX, logic. Per-task.

## Naming convention

- `*.template` — rename to the real name and fill in `[BRACKETS]`
  (`CLAUDE.md.template` → `CLAUDE.md`).
- Everything else (commands, `ralph.sh`) is usable as-is; edit the
  project-specific bits.

## Quick start

0. Browse **[`examples/`](examples/)** to see filled-in skills, agents, rules,
   specs, prompts, and a working MCP server before starting from a template.
1. `cp CLAUDE.md.template <project>/CLAUDE.md` and fill it in.
2. Copy `.claude/commands/` into your project's `.claude/commands/`.
3. Merge `.claude/settings.json.template` into `<project>/.claude/settings.json`.
4. Pick an orchestration pattern from `orchestration/` when a task is too big
   for one context. Use `.claude/commands/evaluate.md` (`/evaluate`) if unsure
   which pattern fits.

## Copy by scenario

You don't copy all of anvil — you copy the section that matches what you're
doing. Each row is a goal, the paths it needs, and the component it maps to in
[`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) (§6). Start with the **Baseline**
row; add rows as the need appears.

| I want to… | Copy these | Component |
|------------|-----------|-----------|
| **Baseline** — establish project conventions | `CLAUDE.md.template` · `GLOSSARY.md.template` · `.claude/settings.json.template` | Context & config |
| Spec-driven a single feature | `SPEC.md.template` (with the Baseline above) | Context |
| Vibe-code a prototype fast | `PROMPT.md.template` · browse `examples/prompts/` | Context |
| Add repeatable slash commands | `.claude/commands/` (usable as-is) | Reusable behaviors |
| Encode expertise as a skill | `.claude/skills/SKILL.md.template` · `docs/SKILL_AUTHORING_GUIDE.md` · `examples/skills/` | Reusable behaviors |
| Connect external data/tools (MCP) | `.claude/settings.mcp.json.template` · `examples/mcp-server/` | Config + reference |
| Auto-format / guard commands | `.claude/settings.hooks.json.template` · `.claude/hooks/` | Config |
| Run a big multi-step task | `orchestration/` — pick a pattern with `/evaluate` | Orchestration |
| Autonomous iteration loop | `orchestration/ralph/` | Orchestration |
| Multi-agent feature (layers) | `.claude/agents/AGENT.md.template` · `orchestration/orchestrate.md.template` · `examples/agents/` | Behaviors + orchestration |
| Large phased refactor | `orchestration/migration-plan.md.template` · `examples/plans/` | Orchestration |
| Path-scoped guardrails | `.claude/rules/` · `examples/rules/` | Context |
| Track quality, debt, learning | `.claude/pattern-log.md.template` · `.claude/debt-ledger.md.template` · `.claude/evals/` | Decision & feedback |
| Pick the right AI pattern | `docs/DECISION_FRAMEWORK.md` · `.claude/commands/evaluate.md` | Decision & feedback |
| Open-source the repo | `GOVERNANCE.md.template` · `CONTRIBUTING.md.template` · `CODE_OF_CONDUCT.md.template` · `SECURITY.md.template` | Governance & community |
| Record architecture decisions | `docs/ADR.md.template` | Decision & feedback |

Copy the destination name (drop `.template`) and fill in the `[BRACKETS]`.
