# Examples

Filled-in, real instances of the anvil templates — read these to see what a good
one looks like, then start from the matching `*.template`. Nothing here is meant
to be copied verbatim; it's reference.

```
examples/
├── skills/         # Real SKILL instances (→ .claude/skills/SKILL.md.template)
│   ├── frontend-design.md       # Distinctive, non-generic frontends
│   ├── api-design.md            # RESTful API conventions
│   └── pptx-presentation.md     # PowerPoint via python-pptx
│
├── agents/         # Real subagent instances (→ .claude/agents/AGENT.md.template)
│   ├── data-layer.md            # Repository / CRUD specialist
│   ├── business-logic.md        # Service / validation specialist
│   └── api-layer.md             # Express routes specialist
│
├── rules/          # Real rule instances (→ .claude/rules/RULE.md.template)
│   ├── accessibility.md         # a11y rule scoped to .tsx
│   └── testing.md               # test rule scoped to src/
│
├── orchestration/  # Real orchestrator (→ orchestration/orchestrate.md.template)
│   └── invitation-service-orchestrator.md  # Parent delegates to the 3 agents below
│
├── plans/          # Real plan instance (→ orchestration/migration-plan.md.template)
│   └── migration-flat-to-layered.md  # 5-phase Express refactor to layered arch
│
├── specs/          # Real SPEC instances (→ SPEC.md.template)
│   ├── invitation-service.md    # API feature with tokens, validation, error table
│   ├── tasks-api.md             # CRUD task API spec
│   ├── fullstack-task-app.md    # Full-stack app spec (agent-team scope)
│   ├── new-feature.md           # Small feature spec
│   └── pagination-util.md       # Library/utility spec (drives the Ralph loop)
│
├── prompts/        # Real PROMPT instances (→ PROMPT.md.template)
│   ├── data-dashboard.md        # Chart.js analytics dashboard
│   ├── landing-page.md          # Marketing landing page
│   ├── retrowave-game.md        # Canvas game
│   ├── nextjs-auth.md           # Next.js auth (library-specific, MCP-assisted)
│   └── supabase-realtime.md     # Supabase realtime (library-specific)
│
└── mcp-server/     # A working custom MCP server (TypeScript)
    ├── src/server.ts            # Server implementation
    ├── .mcp.json                # How to register it
    ├── package.json
    ├── tsconfig.json
    └── README.md
```

The `invitation-service` spec, the three layered agents (`data-layer` →
`business-logic` → `api-layer`), and `orchestration/invitation-service-orchestrator.md`
are designed to be read together — they show one feature built by sequential
subagent delegation. The `pagination-util` spec drives the loop in
`orchestration/ralph/`.
