# /evaluate

Evaluate which AI-development pattern best fits a given task.

Analyze the task and recommend an approach:

1. **Assess the task**:
   - How complex is it? (minutes, hours, days)
   - Can concerns be separated? (frontend/backend, modules, layers)
   - Is it visual/creative or logic-heavy?
   - Does it need external data or tools?
   - One-off or a repeating pattern?

2. **Recommend a pattern**:
   - **Vibe Coding** — quick visual prototypes (see `PROMPT.md.template`)
   - **Skills + Commands** — repeating patterns (`.claude/skills`, `.claude/commands`)
   - **MCP** — external data/tools needed (`.claude/settings.mcp.json.template`)
   - **Ralph / Tasks** — too big for one context (`orchestration/ralph/`)
   - **Multi-Phase** — large refactors (`orchestration/migration-plan.md.template`)
   - **Subagents** — separable concerns, sequential (`orchestration/orchestrate.md.template`)
   - **Swarms** — independent parallel work (`orchestration/TASKS.md.template`)
   - **Agent Teams** — full applications

3. **Explain why**: One sentence on why this pattern beats the alternatives.

4. **Suggest a starting point**: The first concrete step.
