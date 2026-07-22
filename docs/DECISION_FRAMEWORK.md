# AI Development Decision Framework

Not every task needs the same level of AI involvement. This is the reference
behind the `/evaluate` command (`.claude/commands/evaluate.md`): match the
pattern to the task, then reach for the matching anvil artifact.

## Quick reference: which pattern?

```
Situation                          → Pattern            → Anvil artifact
──────────────────────────────────────────────────────────────────────────────
Quick prototype / visual project   → Vibe Coding        → PROMPT.md.template
Consistent code quality            → Skills + Commands  → .claude/skills, .claude/commands
External data / live docs          → MCP Servers        → .claude/settings.mcp.json.template
Multi-step feature (one agent)     → Ralph / Tasks      → orchestration/ralph/
Large refactor                     → Multi-Phase Plan   → orchestration/migration-plan.md.template
Feature with separable concerns    → Subagents          → orchestration/orchestrate.md.template
Independent parallel work          → Swarms             → orchestration/TASKS.md.template
Full application                   → Agent Teams        → (backend + frontend + testing agents)
Testing & hardening                → AI Testing         → .claude/commands/test-coverage.md
```

## By task type

**"I need a prototype or visual project fast"**
→ **Vibe Coding**: Write a spec with technology + visual + interaction +
constraints. Let Claude build it autonomously. Best for games, dashboards,
landing pages, demos. Start from `PROMPT.md.template`; see filled examples in
`examples/prompts/`.

**"I keep doing the same thing and getting inconsistent results"**
→ **Skills**: Encode your expertise in a `.claude/skills/` file. Five sections:
Purpose, Principles, Patterns, Anti-Patterns, Checklist. Start from
`.claude/skills/SKILL.md.template`; see `docs/SKILL_AUTHORING_GUIDE.md`.

**"I repeat the same prompts over and over"**
→ **Slash Commands**: Turn the prompt into a `.claude/commands/` file. One-word
trigger, same result every time.

**"Claude uses outdated APIs or hallucinates library usage"**
→ **MCP + Context7**: `claude mcp add context7` — fetches real, versioned docs
at query time. Register servers in `.claude/settings.mcp.json.template`.

**"I need to debug something in the browser"**
→ **DevTools MCP**: Screenshots, console, network, performance traces. Be
specific about what to check. See `.claude/commands/debug-runtime.md`.

**"I need to connect Claude to an internal system"**
→ **Custom MCP Server**: A process registering tools with names, descriptions,
and schemas. See the working server in `examples/mcp-server/`.

**"This task is too big for one context window"**
→ **Ralph Loop**: Autonomous iteration with fresh context per cycle
(`orchestration/ralph/`). Or **Tasks**: structured dependency tracking across
sessions.

**"I need to refactor a large codebase"**
→ **Multi-Phase Planning**: Plan → Scaffold → Implement → Test → Integrate,
committing at each phase. Start from `orchestration/migration-plan.md.template`;
see `examples/plans/migration-flat-to-layered.md`.

**"This feature has cleanly separable concerns"**
→ **Subagents**: Sequential specialists, each in their own context
(`orchestration/orchestrate.md.template`; see
`examples/orchestration/invitation-service-orchestrator.md`). Or **Swarms**:
parallel workers with a shared task board (`orchestration/TASKS.md.template`).

**"I need to build a full application"**
→ **Agent Teams**: Backend + Frontend + Testing teammates with shared types as
the contract. See the layered agents in `examples/agents/`.

**"I need to validate quality and catch bugs"**
→ **AI Testing**: Test generation, TDD with AI, runtime debugging. See
`.claude/commands/test-coverage.md` and `.claude/commands/verify.md`.

## By complexity

```
Simple (minutes)     → Vibe coding, slash commands
Medium (hours)       → Skills + MCP, Ralph loop, Tasks
Complex (days)       → Multi-phase planning, subagents
Large (weeks)        → Agent teams, swarms
```

## By team size

```
Solo developer       → Skills, commands, MCP, Ralph loop
Small team (2-5)     → Shared CLAUDE.md, shared skills, agent teams
Larger team (5+)     → Skill catalogs, MCP server library, plugins
```

## Anti-patterns to avoid

**Over-orchestrating simple tasks**: Don't set up a 3-agent team to build a
utility function. Match complexity to the task.

**Skipping the spec**: Vibe coding without a spec produces generic results. The
spec is what makes it work.

**One giant context window**: If Claude starts losing track of earlier
instructions, you've hit the context ceiling. Break the work into phases or use
subagents.

**Not saving what works**: If a prompt produced great results, save it — as a
spec template, a skill, or a slash command. Future-you will thank you.

**Ignoring test output**: When Claude generates tests and some fail, those
failures often reveal real bugs. Don't skip them.
