# How Anvil Fits Together

Anvil isn't a stack you install top-to-bottom — it's a set of pieces that snap
together around one loop: **decide → build → verify → learn**. These five
diagrams show the pieces and how they connect. Start with the workflow loop; the
rest zoom into one region of it.

- [1. The workflow loop](#1-the-workflow-loop) — the cycle every task runs through
- [2. Context layers](#2-context-layers) — what Claude reads, and when
- [3. Patterns → templates → examples](#3-patterns--templates--examples) — pick a pattern, fill a template, learn from an example
- [4. Orchestration internals](#4-orchestration-internals) — how the four multi-step patterns actually run
- [5. Project scaffolding](#5-project-scaffolding) — governance, community, and decision records
- [6. Component boundaries](#6-component-boundaries) — which files and folders own which concept

---

## 1. The workflow loop

Every task enters through `/evaluate`, which routes to a pattern via the
decision framework. You build, verify, and retro — and the retro feeds a
pattern-log that, over time, tunes which pattern you reach for next. Debt and
promotable work loop back to the top.

```mermaid
flowchart TB
    TASK([New task or feature]) --> EVAL["/evaluate"]
    EVAL --> DF["docs/DECISION_FRAMEWORK.md<br/>which pattern fits?"]
    DF --> PICK{Pattern chosen}
    PICK --> BUILD["Build with the pattern's artifact<br/>(see Patterns diagram)"]
    BUILD --> VERIFY["Verify:<br/>/verify · /review · /test-coverage<br/>/debug-runtime · /ux-audit"]
    VERIFY --> EVALS[".claude/evals/<br/>behavioral tests for rules"]
    VERIFY --> DEBT[".claude/debt-ledger.md<br/>log known compromises"]
    VERIFY --> RETRO["/retro"]
    RETRO --> PLOG[".claude/pattern-log.md<br/>what worked / what to improve"]
    PLOG --> ADOPT["docs/ADOPTION.md<br/>what to invest in next"]
    ADOPT -. informs next choice .-> DF
    DEBT -. reworked as .-> TASK
    PLOG -. promote reusable work .-> PROMOTE["New skill / command /<br/>agent / template"]
    PROMOTE -. feeds .-> DF
```

---

## 2. Context layers

Not everything loads at once. `CLAUDE.md` and rules are read every session;
`SPEC.md` and plans come in per task; features and docs are pulled on demand;
config shapes how the whole harness behaves.

```mermaid
flowchart TB
    subgraph PERM["Permanent — auto-loaded every session"]
        direction TB
        CLAUDE["CLAUDE.md<br/>how we work here"]
        RULES[".claude/rules/*<br/>path-scoped, glob-triggered"]
        GLOSS["GLOSSARY.md<br/>shared vocabulary"]
        AGENTSMD["AGENTS.md<br/>cross-tool instructions"]
        MEM[".claude/MEMORY.md<br/>durable cross-session memory"]
    end
    subgraph TASK["Per-task — loaded when relevant"]
        direction TB
        SPEC["SPEC.md<br/>what we build now"]
        PROMPTF["PROMPT.md<br/>one-shot / vibe brief"]
        PLAN[".claude/plans/*<br/>bounded plan"]
    end
    subgraph DEMAND["On-demand — pulled in as needed"]
        direction TB
        FEAT[".claude/features/*<br/>domain deep-dives"]
        DOCS["docs/*<br/>guides + ADRs"]
    end
    subgraph CFG["Config — how the harness behaves"]
        direction TB
        SET[".claude/settings.json<br/>model, permissions"]
        MCP[".claude/settings.mcp.json<br/>MCP servers"]
        HOOKS[".claude/settings.hooks.json<br/>+ hooks/*.sh"]
        INDEX[".claude/INDEX.json<br/>artifact manifest"]
    end
    CLAUDE --> SPEC
    SPEC --> PLAN
    RULES -. cite .-> GLOSS
    SPEC -. links .-> FEAT
    CFG -. shapes every session .-> PERM
    INDEX -. catalogs .-> DEMAND
```

---

## 3. Patterns → templates → examples

Each pattern from the decision framework has a template you fill and a filled
example you can read first. Same three-column shape across all of them.

```mermaid
flowchart LR
    subgraph PAT["Pattern (from decision framework)"]
        direction TB
        V["Vibe Coding"]
        SK["Skills + Commands"]
        MC["MCP"]
        RA["Ralph / Tasks"]
        MP["Multi-Phase"]
        SA["Subagents"]
        SW["Swarms"]
    end
    subgraph TPL["Template to fill"]
        direction TB
        TV["PROMPT.md.template"]
        TSK[".claude/skills/SKILL.md.template<br/>.claude/commands/*"]
        TMC[".claude/settings.mcp.json.template"]
        TRA["orchestration/ralph/*"]
        TMP["orchestration/migration-plan.md.template"]
        TSA["orchestration/orchestrate.md.template<br/>.claude/agents/AGENT.md.template"]
        TSW["orchestration/TASKS.md.template"]
    end
    subgraph EX["Filled example to learn from"]
        direction TB
        EV["examples/prompts/*"]
        ESK["examples/skills/*"]
        EMC["examples/mcp-server/*"]
        ERA["examples/specs/pagination-util.md"]
        EMP["examples/plans/migration-flat-to-layered.md"]
        ESA["examples/agents/*<br/>examples/orchestration/*"]
        ESW["examples/specs/fullstack-task-app.md"]
    end
    V --> TV --> EV
    SK --> TSK --> ESK
    MC --> TMC --> EMC
    RA --> TRA --> ERA
    MP --> TMP --> EMP
    SA --> TSA --> ESA
    SW --> TSW --> ESW
```

---

## 4. Orchestration internals

The four multi-step patterns each have a distinct shape: Ralph loops on itself,
subagents run in sequence, swarms fan out in parallel, and multi-phase commits
at each stage. `SPEC.md` drives all four.

```mermaid
flowchart TB
    subgraph RALPH["Ralph loop — autonomous, fresh context per cycle"]
        direction LR
        RSH["ralph.sh<br/>loop runner"] --> RPRD["prd.json<br/>user stories, pass/fail"]
        RPRD --> RIT["one iteration<br/>ralph/CLAUDE.md prompt"]
        RIT --> RPROG["progress.txt<br/>append learnings"]
        RPROG --> RSH
    end
    subgraph SUBS["Subagents — sequential specialists"]
        direction LR
        ORCH["orchestrate.md<br/>parent delegates"] --> DL["data-layer"]
        DL --> BL["business-logic"]
        BL --> AL["api-layer"]
    end
    subgraph SWARM["Swarm — parallel workers"]
        direction LR
        BOARD["TASKS.md<br/>shared task board"] --> W1["worker A"]
        BOARD --> W2["worker B"]
        BOARD --> W3["worker C"]
    end
    subgraph PHASE["Multi-phase — commit per phase"]
        direction LR
        PL["migration-plan.md"] --> PH1["Plan"] --> PH2["Scaffold"] --> PH3["Implement"] --> PH4["Test"] --> PH5["Integrate"]
    end
    SPEC["SPEC.md drives all four"] --> RALPH & SUBS & SWARM & PHASE
```

---

## 5. Project scaffolding

The non-AI files that make a repo a healthy project: who decides, how to
contribute, how to behave, how to report a vuln — plus the running record of
decisions (ADRs) and known compromises (debt ledger).

```mermaid
flowchart TB
    ROOT["Project repo"]
    subgraph GOV["Governance + community"]
        direction TB
        G["GOVERNANCE.md<br/>roles, decisions, maintainers"]
        C["CONTRIBUTING.md<br/>build, test, submit"]
        COC["CODE_OF_CONDUCT.md<br/>standards + enforcement"]
        SEC["SECURITY.md<br/>vuln reporting"]
    end
    subgraph REC["Decision + debt record"]
        direction TB
        ADR["docs/ADR.md<br/>architecture decisions"]
        DEBT[".claude/debt-ledger.md<br/>tracked compromises"]
    end
    ROOT --> GOV
    ROOT --> REC
    C -. enforces .-> COC
    C -. points reviewers to .-> ADR
    G -. owns .-> DEBT
```

---

## 6. Component boundaries

The diagrams above are conceptual. This is where those concepts live on disk —
seven components, each owning a distinct set of paths. The boundary rule: a file
belongs to exactly one component, and components talk to each other only through
the edges shown below (config *enables* behaviors; context *feeds* orchestration;
examples *model* both). Nothing reaches across a boundary into another
component's internals.

```mermaid
flowchart TB
    subgraph CTX["Context & memory — what Claude reads"]
        direction TB
        X1["CLAUDE.md · SPEC.md · PROMPT.md"]
        X2["GLOSSARY.md · AGENTS.md"]
        X3[".claude/MEMORY.md"]
        X4[".claude/rules/ · .claude/features/ · .claude/plans/"]
    end
    subgraph CFG["Harness config — how Claude runs"]
        direction TB
        F1[".claude/settings.json"]
        F2[".claude/settings.mcp.json"]
        F3[".claude/settings.hooks.json · .claude/hooks/"]
        F4[".claude/INDEX.json"]
    end
    subgraph BEH["Reusable behaviors — invokable units"]
        direction TB
        B1[".claude/skills/"]
        B2[".claude/commands/"]
        B3[".claude/agents/"]
    end
    subgraph ORC["Orchestration — multi-step drivers"]
        direction TB
        O1["orchestration/orchestrate.md"]
        O2["orchestration/TASKS.md"]
        O3["orchestration/migration-plan.md"]
        O4["orchestration/ralph/"]
    end
    subgraph FB["Decision & feedback — steer + learn"]
        direction TB
        D1["docs/DECISION_FRAMEWORK.md · ADOPTION.md"]
        D2["docs/ARCHITECTURE.md · SKILL_AUTHORING_GUIDE.md · ADR.md"]
        D3[".claude/pattern-log.md · .claude/debt-ledger.md"]
        D4[".claude/evals/"]
    end
    subgraph GOV["Governance & community — project health"]
        direction TB
        G1["GOVERNANCE.md · CONTRIBUTING.md"]
        G2["CODE_OF_CONDUCT.md · SECURITY.md"]
    end
    subgraph EX["Reference — filled instances (copy nothing verbatim)"]
        direction TB
        E1["examples/skills · agents · rules"]
        E2["examples/specs · prompts · plans"]
        E3["examples/orchestration · mcp-server"]
    end
    CTX --> BEH
    CTX --> ORC
    CFG -. enables .-> BEH
    BEH --> FB
    ORC --> FB
    EX -. models .-> BEH
    EX -. models .-> ORC
    GOV -. frames .-> CTX
```

### Ownership table

Precise boundary: every path in the repo, the one component that owns it, and
the conceptual diagram it serves.

| Component | Owns these paths | Concept it implements | Diagram |
|-----------|------------------|-----------------------|---------|
| **Context & memory** | `CLAUDE.md` · `SPEC.md` · `PROMPT.md` · `GLOSSARY.md` · `AGENTS.md` · `.claude/MEMORY.md` · `.claude/rules/` · `.claude/features/` · `.claude/plans/` | What Claude reads, and when | 2 |
| **Harness config** | `.claude/settings.json` · `.claude/settings.mcp.json` · `.claude/settings.hooks.json` · `.claude/hooks/` · `.claude/INDEX.json` | How the harness behaves | 2 |
| **Reusable behaviors** | `.claude/skills/` · `.claude/commands/` · `.claude/agents/` | Invokable units (skills, commands, subagents) | 3, 4 |
| **Orchestration** | `orchestration/orchestrate.md` · `orchestration/TASKS.md` · `orchestration/migration-plan.md` · `orchestration/ralph/` | Multi-step patterns (subagents, swarm, phases, Ralph) | 3, 4 |
| **Decision & feedback** | `docs/DECISION_FRAMEWORK.md` · `docs/ADOPTION.md` · `docs/ARCHITECTURE.md` · `docs/SKILL_AUTHORING_GUIDE.md` · `docs/ADR.md` · `.claude/pattern-log.md` · `.claude/debt-ledger.md` · `.claude/evals/` | Steer the choice, learn from the result | 1, 5 |
| **Governance & community** | `GOVERNANCE.md` · `CONTRIBUTING.md` · `CODE_OF_CONDUCT.md` · `SECURITY.md` | Project health, non-AI | 5 |
| **Reference** | `examples/**` | Filled instances of every template | 3 |

> **Note on `*.template`:** everything under a component keeps its `.template`
> suffix in anvil and is renamed on copy into a real project (`CLAUDE.md.template`
> → `CLAUDE.md`). The boundaries above use the destination names.
