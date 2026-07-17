# Anvil — AI-Assisted Development Templates

A copy-and-fill template library for setting up AI-assisted development in any
project. Extracted and generalized from working demos.

Copy the pieces you need into your project, then fill in the `[BRACKETS]`.

## What's here

```
anvil/
├── CLAUDE.md.template          # Project constitution (permanent context)
├── SPEC.md.template            # Feature blueprint (what to build now)
├── PROMPT.md.template          # One-shot / vibe-coding prompt
│
├── .claude/
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
│   │   ├── SKILL.md.template           # Skill scaffold
│   │   ├── frontend-design.md          # Example: distinctive frontends
│   │   └── api-design.md               # Example: RESTful API design
│   ├── agents/
│   │   ├── AGENT.md.template           # Subagent scaffold
│   │   ├── data-layer.md               # Example specialist
│   │   ├── business-logic.md           # Example specialist
│   │   └── api-layer.md                # Example specialist
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
└── docs/
    └── SKILL_AUTHORING_GUIDE.md        # How to write skills
```

## The two-file mental model

- **CLAUDE.md** — *How we work here.* Read automatically every session. Tech
  stack, conventions, commands, architecture rules. Permanent.
- **SPEC.md** — *What we're building right now.* One feature's requirements,
  UI/UX, logic. Per-task.

## Naming convention

- `*.template` — rename to the real name and fill in `[BRACKETS]`
  (`CLAUDE.md.template` → `CLAUDE.md`).
- Everything else (commands, example skills/agents, `ralph.sh`) is usable as-is;
  edit the project-specific bits.

## Quick start

1. `cp CLAUDE.md.template <project>/CLAUDE.md` and fill it in.
2. Copy `.claude/commands/` into your project's `.claude/commands/`.
3. Merge `.claude/settings.json.template` into `<project>/.claude/settings.json`.
4. Pick an orchestration pattern from `orchestration/` when a task is too big
   for one context. Use `.claude/commands/evaluate.md` (`/evaluate`) if unsure
   which pattern fits.
