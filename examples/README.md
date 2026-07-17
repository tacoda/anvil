# Examples

Filled-in, real instances of the anvil templates — read these to see what a good
one looks like, then start from the matching `*.template`. Nothing here is meant
to be copied verbatim; it's reference.

```
examples/
├── specs/          # Real SPEC.md.template instances
│   ├── invitation-service.md    # API feature with tokens, validation, error table
│   ├── tasks-api.md             # CRUD task API spec
│   ├── fullstack-task-app.md    # Full-stack app spec (agent-team scope)
│   ├── new-feature.md           # Small feature spec
│   └── pagination-util.md       # Library/utility spec (drives the Ralph loop)
│
├── prompts/        # Real PROMPT.md.template instances (vibe coding)
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

## See also — examples living next to their templates

- **Skills**: `.claude/skills/frontend-design.md`, `api-design.md`, `pptx-presentation.md`
- **Agents**: `.claude/agents/data-layer.md`, `business-logic.md`, `api-layer.md`
- **Rules**: `.claude/rules/accessibility.md`, `testing.md`
- **Orchestration**: `orchestration/ralph/` (the pagination-util spec above drives it)
