# How-To — a task-oriented guide that walks a competent user through achieving one specific goal

**Use when:** A user who already knows the product needs to accomplish a real-world task (e.g. "create an issue in GitHub", "resolve a merge conflict"). One logical goal per page, the surest/safest path, alerting to unexpected scenarios. Restrict to ~8–10 steps; split big tasks into sub-tasks.
**Don't use when:** The reader is learning a feature for the first time and needs concepts and a guaranteed-success lesson — that's a **tutorial** (learning-oriented). For the fastest first end-to-end success on a brand-new product, use a **quickstart**. To explain concepts, use **explanation**; to list facts/parameters, use **reference**. Never teach concepts in a how-to.
**Audience & voice:** Competent users with practical knowledge of the tools, configs, and the product — assume it. Goal-focused, concise. Imperative verbs, second person. Use conditional imperatives ("If you want X, do Y"); document only one recommended method; alert to errors and unexpected cases with callouts.

## Skeleton

```
# {Title}

## Overview

This guide explains how to {brief description of the task}.

{Optional: When and why your user might want to perform the task.}

## Before you start

{Optional.}

Before you {brief task description}, ensure:

* {Prerequisite 1 — e.g. software/tools, access/credentials, environment, other guides to read}
* {Prerequisite 2}

{Optional: cue users who are in the wrong place toward a better option, e.g. "If you're on Linux, see {link}."}

## {Task name}

{Optional: concise purpose of this task — only if not obvious from the title.}

1. {Write the action here. Start with a verb; express a complete thought.}

   {Optional: Explanatory text}

   {Optional: Code sample or screenshot}

   {Optional: Result / expected output}

2. {Next step.}

   2.1. {Substep}
   2.2. {Substep}

### {Sub-task}

{Optional. Only if the task is big and complex — give the sub-task its own steps.}

## See also

* {Reference link}
* {Concept link}
* {Troubleshooting link}
```

## Filling tips

- **Overview:** State the problem/task clearly, plus when and why the user would do it (e.g. "pull requests let others know about changes you pushed to a branch"). Assume the user already knows the product and what they want to achieve.
- **Before you start:** Optional but prevents mid-task surprises. List prerequisites — product familiarity, software/tools, environment setup, auth/credentials, other docs to read. Group into categories (e.g. background knowledge vs. software) when long. Optionally redirect readers who are in the wrong place.
- **Steps:** One action per step; start with a base-form verb expressed as a full thought ("Connect to the VM instance"). Orient the user (which file/dialog) before the action, give brief why-context, and show expected output so they can self-verify. Document only the single recommended path — don't enumerate alternatives. Test end-to-end and keep code current; re-test after major releases. Max ~8–10 steps; break complex work into sub-tasks.
- **See also:** Link tangentially related material (other how-tos, concepts, reference, troubleshooting) here at the bottom rather than interrupting the flow — but keep links sparse and keep users on one page.
