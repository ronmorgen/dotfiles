---
name: technical-writer
description: Write technical documentation the right way by routing each request to the correct content type — tutorial, how-to, quickstart, concept, reference, installation guide, troubleshooting, glossary, README, release notes, changelog, or API/SDK docs — then drafting from a battle-tested skeleton and a distilled style guide. Use whenever the user needs to write, structure, or improve docs: "write a tutorial/how-to/README/release notes", "document this API/endpoint/feature", "explain this concept", "create a reference/troubleshooting guide", or any documentation, knowledge-base, or onboarding content.
---

# Technical Writer

Good documentation isn't one undifferentiated thing — it's a set of distinct
**content types**, each with one job, one audience, and one structure. This skill
(distilled from The Good Docs Project templates) routes a request to the right type,
drafts from that type's proven skeleton, and applies a shared style guide.

The single most common documentation failure is mixing types on one page — a
tutorial bloated with reference tables, a concept padded with steps. Pick one type,
do its job, and link to the others.

## Contents

- `references/content-type-map.md` — decision guide: request → the right content type (Diátaxis-aligned).
- `templates/<type>.md` — for each content type: purpose, use/don't-use, audience, the fill-in skeleton, and per-section filling tips.
- `references/style.md` — voice, plain-language, procedural-step, structure, and formatting rules.
- `references/checklist.md` — pre-delivery quality gate.

Available templates: `tutorial`, `how-to`, `quickstart`, `concept`, `reference`,
`installation-guide`, `troubleshooting`, `glossary`, `readme`, `release-notes`,
`changelog`, `api-getting-started`, `api-reference`, `sdk-overview`.

## Workflow

1. **Classify.** Read `references/content-type-map.md` and pick the content type that
   matches the reader's _situation_. If the request genuinely spans several (e.g.
   "document this feature"), name the set and start with the most useful one — ask
   the user only when the choice is truly ambiguous.

2. **Profile the audience.** Establish technical level (beginner/intermediate/expert),
   role (end user/developer/admin/stakeholder), prior-knowledge assumptions, and
   context (internal/external/open source). State these in the draft's prerequisites.

3. **Load the template.** Read `templates/<type>.md`. Draft into its skeleton,
   replacing every `{curly-bracket}` placeholder. Start simple; layer in complexity.
   Use the per-section filling tips for what each section should contain.

4. **Apply style.** Write to `references/style.md` as you go — active voice, second
   person, present tense, imperative steps, no marketing fluff, one term per concept.

5. **Self-check.** Run the draft through `references/checklist.md` before delivering.
   Verify code samples run and no placeholders remain.

6. **Point to companions.** Name the related content types the reader will likely
   need next (a how-to's matching reference, a concept's matching tutorial, a
   troubleshooting entry for the failure modes).

## Example triggers

- "Write a tutorial for setting up the dev environment" → `tutorial`
- "How do I rotate an API key?" → `how-to`
- "Get users running in 5 minutes" → `quickstart`
- "Explain how our auth model works" → `concept`
- "Document every parameter of this endpoint" → `api-reference`
- "Write a README for this project" → `readme`
- "Draft release notes for v2.0" → `release-notes`
- "Write a troubleshooting guide for failed deploys" → `troubleshooting`

Route first, then draft from the skeleton — never freehand a doc whose type has a template.
