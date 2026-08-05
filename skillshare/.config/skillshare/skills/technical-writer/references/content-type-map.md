# Content-type map — route a request to the right template

Documentation isn't one thing. Each content type has one job. Mixing jobs on one
page is the most common documentation failure: a tutorial bloated with API tables,
a reference padded with narrative. Pick the type that matches the reader's
*situation*, then load `templates/<type>.md`.

## The Diátaxis core (the four foundational types)

Two axes: is the reader **studying** or **working**? Do they need **practical
steps** or **theoretical knowledge**?

| | Practical steps | Theoretical knowledge |
|---|---|---|
| **Studying** (acquiring skill) | **tutorial** — a guided lesson | **concept** — explanation / "why it works this way" |
| **Working** (applying skill) | **how-to** — achieve one specific goal | **reference** — look up exact facts |

- **tutorial** — Reader is a beginner who wants to *learn by doing*. You choose the
  path; success is guaranteed and confidence-building. Not for getting a real job done.
- **how-to** — Reader is competent and has a *specific goal right now* ("rotate an
  API key"). Assumes context; no teaching. Not for beginners with no grounding.
- **reference** — Reader needs to *look something up* (params, fields, commands,
  return codes). Dry, exhaustive, structured. No steps, no opinions.
- **concept** — Reader wants to *understand* what something is or why it exists.
  Prose, diagrams, trade-offs. No procedures.

## Routing table (request phrasing → type)

| The reader wants to… / The request says… | Use |
|---|---|
| "Teach me X from scratch," learn by following along | **tutorial** |
| "How do I <specific task>," "steps to <goal>" | **how-to** |
| "Get me running in 5 minutes," first success fast | **quickstart** |
| "What is X," "why does X work this way," "explain X" | **concept** |
| "List all the params/fields/flags/commands," lookup | **reference** |
| "Install / set up / configure it" | **installation-guide** |
| "It's broken / erroring / not working — fix it" | **troubleshooting** |
| "Define this term," vocabulary across the docs | **glossary** |
| "Front door for the project / repo," orient a newcomer | **readme** |
| "What changed in version N" (user-facing) | **release-notes** |
| "Terse dated list of changes" (developer-facing) | **changelog** |
| "Make my first API call," onboard to the API | **api-getting-started** |
| "Document every endpoint / method / parameter" | **api-reference** |
| "Orient a dev to our client library / SDK" | **sdk-overview** |

## Near-miss disambiguation

- **quickstart vs tutorial:** quickstart optimizes for *speed to first success*
  (minimum viable path, may skip the why); tutorial optimizes for *learning*
  (teaches concepts along the way). Quickstart is shorter and assumes more.
- **how-to vs tutorial:** how-to serves a goal the reader already has; tutorial
  serves a lesson you designed. How-to assumes competence; tutorial assumes none.
- **concept vs reference:** concept explains and persuades; reference lists and
  is exhaustive. If it has tables of facts, it's reference; if it has "because," concept.
- **installation-guide vs quickstart:** installation gets the software *installed and
  configured*; quickstart gets the reader to a *first result*. Often sequential.
- **troubleshooting vs how-to:** how-to assumes the happy path; troubleshooting starts
  from a symptom/error and diagnoses. If the title is a problem, it's troubleshooting.
- **release-notes vs changelog:** release-notes are user-facing and narrative
  ("what's new and why it matters"); changelog is a terse, dated, developer-facing
  list (often Keep a Changelog format: Added/Changed/Fixed/Removed).
- **api-getting-started vs api-reference:** getting-started is one happy-path
  walkthrough to a first successful call; reference documents every endpoint
  exhaustively for lookup. Getting-started vs sdk-overview: SDK overview orients to
  a *client library* (install, auth, idioms); api-getting-started is the raw API.

## Most docs need more than one type

A feature usually needs a small *set*: a how-to (do the task) + a reference (the
params) + maybe a concept (why) and a troubleshooting entry (when it breaks). When
you finish one, name the companions the reader will likely need next.
