---
name: brainstorming
description: Turn a rough idea into a validated design and a written spec before any implementation begins. Use before nontrivial creative work — adding a feature, building a component, introducing functionality, or changing existing behavior — and whenever requirements are ambiguous, the approach is unsettled, or the request spans multiple subsystems. Triggers on "brainstorm", "design this", "how should I build", "help me think through", "I want to add X", or any request to explore an idea before writing code.
---

# Brainstorming Ideas into Designs

Turn an idea into a fully formed design through collaborative dialogue, then write it
down as a spec. Understand the project first, ask questions one at a time, propose
approaches with trade-offs, and get explicit approval before anything gets built.

The goal is to surface unexamined assumptions while they are still cheap to fix.

## When This Applies

Scale the process to the size of the change, matching the tiers in CLAUDE.md:

| Change | Process |
|---|---|
| **Trivial** — single-purpose, ≤3 steps, no architectural decisions | Skip brainstorming. Execute directly. |
| **Nontrivial** — >3 steps, architectural decisions, or ambiguous requirements | Full process below. Design and approval required before implementation. |
| **Large** — >3 files | Decompose first, then brainstorm the first sub-project. |

**The gate:** for nontrivial and large work, do not write implementation code,
scaffold a project, or take implementation actions until you have presented a design
and the user has approved it.

### "This Is Too Simple to Need a Design"

The trivial tier is a real exemption — not every change needs ceremony. But be honest
about which tier you are in. A change is not trivial just because the edit is small.

Ask: does it change an interface, alter data flow, or affect user-visible behavior in
more than one place? Does it introduce a dependency or a new pattern? If yes, it is
nontrivial no matter how few lines it touches. When genuinely torn, treat it as
nontrivial — the design can be three sentences.

## Process

1. **Explore project context** — read the relevant files, docs, and recent commits
2. **Assess scope** — decompose first if the request spans independent subsystems
3. **Ask clarifying questions** — one at a time, until purpose and constraints are clear
4. **Propose 2–3 approaches** — with trade-offs and a recommendation
5. **Present the design** — in sections, confirming each before moving on
6. **Write the spec** — to `docs/specs/YYYY-MM-DD-<topic>-design.md`
7. **Self-review the spec** — fix placeholders, contradictions, ambiguity inline
8. **User reviews the spec** — wait for approval
9. **Hand off to implementation**

Steps 5 and 8 are loops: revise and re-present until approved.

### 1. Explore Project Context

Read before asking. Any question answerable from the codebase, docs, or git history is
a question you should answer yourself — asking it wastes the user's turn and signals you
did not look.

Follow existing patterns. In an established codebase, the design should look like it
belongs there.

### 2. Assess Scope

Before refining details, check whether this is one project or several. If the request
describes multiple independent subsystems — "a platform with chat, file storage, billing,
and analytics" — say so immediately rather than spending questions on a project that
needs decomposing.

To decompose: identify the independent pieces, how they relate, and what order they
should be built in. Then brainstorm the first piece through the normal flow. Each piece
gets its own spec and its own implementation cycle.

### 3. Ask Clarifying Questions

Use the **AskUserQuestion** tool. Ask **one question per message** and wait for the
answer — if a topic needs more exploration, split it into several questions.

Give 2–4 concrete options that represent realistic choices. Generic "Yes / No" options
are only useful when the question is genuinely binary. The user always has "Other".

Focus on purpose, constraints, and success criteria — what makes this done, and what
would make it wrong. Stop when you can state the problem back accurately, not when you
run out of questions.

### 4. Propose Approaches

Offer 2–3 genuinely different approaches, not one real option and two straw men. Lead
with your recommendation and explain the reasoning, then cover the trade-offs of each.

Apply YAGNI ruthlessly. Strip speculative features from every approach before
presenting it — the design should solve the stated problem, not an imagined future one.

### 5. Present the Design

Present in sections, scaled to complexity: a few sentences when straightforward, up to
200–300 words when nuanced. After each section, confirm it looks right before
continuing. Be ready to go back when something does not hold up.

Cover architecture, components, data flow, error handling, and testing.

**Design for isolation.** Break the system into units with one clear purpose,
well-defined interfaces, and independent testability. For each unit you should be able
to say what it does, how to use it, and what it depends on.

Two tests: can someone understand a unit without reading its internals, and can you
change its internals without breaking consumers? If either fails, the boundaries need
work. A file that has grown large is usually a signal it is doing too much.

**In existing codebases.** Where current code genuinely obstructs the work — a tangled
responsibility, an unclear boundary — fold targeted improvements into the design, the
way a careful developer improves code they are already working in. Do not propose
unrelated refactoring; stay on what serves the goal.

### 6. Write the Spec

Save the approved design to `docs/specs/YYYY-MM-DD-<topic>-design.md`, using today's
actual date. Create the directory if needed. User preferences for spec location
override this default.

**Do not commit the spec automatically.** Tell the user where it landed and let them
decide. If they ask you to commit it, follow the git rules — branch first, never commit
directly to `main`.

Use the `technical-writer` skill if the spec needs to double as durable documentation.

### 7. Self-Review the Spec

Reread what you wrote with fresh eyes and fix problems inline:

- **Placeholders** — any TBD, TODO, or vague requirement left standing?
- **Consistency** — do any two sections contradict? Does the architecture match the features described?
- **Scope** — is this focused enough for one implementation plan?
- **Ambiguity** — could a requirement be read two ways? Pick one and make it explicit.

Fix and move on. No second review pass.

### 8. User Reviews the Spec

Ask the user to review the file before implementation begins:

> Spec written to `<path>`. Please review it and tell me if you want changes before I
> start on the implementation plan.

Wait for a response. If they request changes, make them and rerun the self-review.
Proceed only on approval.

### 9. Hand off to Implementation

State the first concrete implementation step and confirm the user wants to proceed now.
For multistep work, use plan mode to lay out the sequence before editing files.

Carry two things forward from CLAUDE.md: fix root causes rather than adding
workarounds, and after writing code, list what could break and suggest tests.

## Anti-Patterns

- **Designing past approval.** Presenting a design and continuing straight into code in the same turn. The gate requires an actual answer.
- **Interviewing instead of reading.** Asking what a file contains, what the stack is, or how something currently works.
- **Question dumps.** Several questions in one message. One at a time, always.
- **Fake alternatives.** Two implausible options padding out the recommendation.
- **Gold-plating.** Designing for requirements nobody stated.
- **Silent scope growth.** Noticing the project is really four projects and refining details anyway.
