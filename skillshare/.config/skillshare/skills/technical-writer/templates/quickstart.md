# Quickstart — the fastest path to a first end-to-end success with a product's primary feature

**Use when:** A user is meeting your product for the first time and you want them running the core ("hello world") feature as fast as possible — minimal concepts, a single happy path, completable in 1–2 hours (less is better). Optional install/auth setup, then the smallest meaningful workflow.
**Don't use when:** The reader needs to learn concepts and the why behind a feature in depth — that's a **getting-started guide** or a **tutorial** (learning-oriented). When they already know the product and need one specific task done, use a **how-to** (task-oriented). For selling/benefits, that's a marketing guide, not a quickstart.
**Audience & voice:** Domain experts who already understand the problem space but are new to *this* product. Minimal conceptual content. Action-first, second person, imperative verbs. Remove setup friction (sandbox accounts), avoid error/edge cases, and guarantee the advertised result.

## Skeleton

```
# {Title}

## Overview

This quickstart guides you through:

* [Part 1](#part-1-task-name)
* [Part 2](#part-2-task-name)

It is intended for {audience}. It assumes you have basic knowledge of:

* {Concept 1 — link to supporting content}
* {Concept 2}

## Before you start

{Optional. Prerequisites to complete first — group by category, e.g. software / hardware.}

* {Prerequisite 1}
* {Prerequisite 2}

## Install

{Optional. Include only if install/config is done by the same person running the quickstart, or is a prerequisite. Provide commands (validated), a way to verify success, and links to detailed/upstream install docs. Often N/A for cloud/API apps — use auth instead.}

## Part 1: {Task name}

{Summarize what the user completes in this part.}

### Step 1: {Step name}

{Explanatory text}

{Optional: Code sample or screenshot}

{Optional: Result of this step}

#### (Optional) Sub step 1: {Substep name}

{Break a step into smaller substeps if it asks too much at once.}

## Part 2: {Task name}

### Step 2: {Step name}

...

## Next steps

Now that you've completed this quickstart, try these to learn more about {feature}:

* {Reference link 1}
* {Reference link 2}

{Optional: a separate "See also" heading for blogs, reference docs, videos, how-tos.}
```

## Filling tips

- **Overview:** Short description of the app and its purpose, what the user will accomplish here, the intended audience, and the basic knowledge assumed. Link each listed concept to supporting material so the page itself stays lean.
- **Before you start:** Optional. List config/setup prerequisites, grouped by category (software, hardware, etc.). Minimize this — push setup burden onto sandbox accounts where possible.
- **Install:** Optional; include only when installation happens alongside the quickstart or is a hard prerequisite. Give validated commands plus a way to confirm success; link out for detailed/upstream instructions. For cloud/API products, swap this for auth/credentials setup.
- **Steps:** Structure as Parts (each = related steps) only if the work is complex; otherwise use flat steps. Number {part}.{step} for easy reference. Start headings with a verb as a complete thought ("Connect to the VM instance"). One action per step; orient the user first, give brief why-context, and show sample output so they can verify. Keep it short and skip error/edge-case handling — that bloats a quickstart.
- **Next steps:** Link logical follow-ons (tutorials, articles) that build on what they just did; optionally add a "See also" for blogs, reference docs, videos, and how-tos.
