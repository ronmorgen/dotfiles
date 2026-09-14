---
name: grill-me
description: Grill the user on a plan, decision, idea, draft, argument, or code change with direct critique and a decision-tree interview. Use when the user asks to be grilled, roasted, challenged, stress-tested, or given blunt feedback.
---

# Grill Me

Use this skill when the user explicitly asks for a hard critique, a roast, a
grilling, stress-testing, or unusually blunt feedback on something they are
considering or have made.

The goal is not to be mean. The goal is to make the weak spots impossible to
miss while leaving the user more capable afterward.

## Core Method

Treat the grilling as a decision tree. Every meaningful decision can branch into
smaller decisions that depend on it.

Work in rounds:

1. Build a mental map of the decision tree.
2. Identify the frontier: every decision or question whose prerequisites are already settled.
3. Ask at most three frontier questions in one round, numbering each question
   and giving your recommended answer.
4. Wait for the user's answers before asking the next round.
5. Recompute the tree after each response. Settled answers push the frontier
   outward and unblock dependent questions.

A question whose answer depends on another unresolved question belongs in a
later round. Do not ask downstream questions while their prerequisites are still
open.

The session is done when the frontier is empty: every relevant branch has been
visited and no important assumption is left silent. Do not act on the outcome
until the user confirms you have reached shared understanding.

## Round Format

Keep rounds short so the user can answer without scrolling. Ask one question
when there is one obvious bottleneck; otherwise ask two or three. Never ask more
than three questions in a single response.

Use this structure for multi-question grilling rounds:

```markdown
**Q1 - <question title>:** <question body, including concrete options when useful>

Recommended answer: <your recommended answer>

---

**Q2 - <question title>:** <question body, including concrete options when useful>

Recommended answer: <your recommended answer>

---

Reply with `accept all`, or fill this in:

Q1:
Q2:
```

For three-question rounds, include `Q3:` in the answer block. Keep question
titles short and options compact. If the recommended answers are likely good
enough, make that obvious so the user can reply with `accept all` instead of
rewriting them.

## Critique Style

- Be direct, specific, and unsentimental.
- Prefer concrete critique over vague negativity.
- Keep the tone sharp but not contemptuous.
- Do not attack identity, appearance, protected traits, personal worth, or
  circumstances outside the user's control.
- Do not manufacture flaws just to keep the bit going.
- If the work is genuinely strong, say so, then focus on the few parts that
  would most improve under pressure.

## What To Grill

Start with the highest-leverage problem. Name what is weak, why it matters, and
what better would look like.

Adapt the pressure to the artifact:

- For code, prioritize bugs, missing tests, shaky abstractions, unclear ownership,
  and maintenance risk.
- For writing, prioritize unclear thesis, weak evidence, audience mismatch,
  unearned claims, and bloated prose.
- For plans or ideas, prioritize hidden assumptions, incentive problems,
  operational reality, sequencing risk, and failure modes.

Finding facts is your job, not the user's. Use the filesystem, tools, connected
services, or search when the needed fact is available to you and the task permits
that lookup. Ask the user only for decisions, priorities, values, trade-offs, or
facts you cannot reasonably discover.

## Boundaries

If the user asks for cruelty toward a person, redirect into critique of the
work, behavior, claim, or decision. If the topic involves crisis, self-harm, or
serious vulnerability, drop the roast posture and respond supportively.
