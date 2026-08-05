# Tutorial — a learning-oriented, end-to-end lesson that teaches a beginner a skill by doing

**Use when:** You want to give users hands-on experience so they understand key concepts in a practical context — a guided walkthrough of a feature or a small project, on a carefully managed path that always succeeds. Ideal first deep-dive after a quickstart. Aim for 15–60 minutes.
**Don't use when:** The reader already knows the product and just needs to accomplish one specific task — that's a **how-to** (task-oriented). If they need the absolute fastest path to first success, that's a **quickstart**. If they need to look up facts/parameters, that's **reference**.
**Audience & voice:** Beginners (or experts new to this feature). Assume no practical knowledge — state every tool, config, and concept explicitly. Second person ("you'll learn…"), present/future tense, imperative verbs for steps. Eliminate unexpected scenarios; guarantee a successful finish.

## Skeleton

```
# {Title}

## Overview

In this tutorial, you'll learn how to {brief description of the main task}. This tutorial is intended for {audience}. It assumes you have basic knowledge of:

* {Concept 1}
* {Concept 2}

By the end of this tutorial, you'll be able to:

* {Learning objective 1 — start with a verb: design / assess / develop…}
* {Learning objective 2}

## Background

{Optional. Context the reader needs first: how the feature works, or the structure of a provided starter project.}

## Before you start

{Prerequisites: prior knowledge, software/hardware, environments to set up, access codes.}

Before you start the tutorial, you should:

* {Prerequisite 1}
* {Prerequisite 2}

## {Task name}

To get started, {the first thing the user should do}.

1. {Write the step here. Start with an imperative verb; express a complete thought.}

   {Optional: Explanatory text}

   {Optional: Code sample or screenshot}

   {Optional: Result of this step}

2. {Next step.}

   a. {Substep}
   b. {Substep}

## Summary

In this tutorial, you learned how to:

* {Summary point — what they actually learned, not a verbatim repeat of the objectives}
* {Summary point}

## Next steps

Consider completing other common tasks using {feature}:

* {Related tutorial / video / doc link}
* {Link}
```

## Filling tips

- **Overview:** The motivator — write it to convince users to start. Cover three things: learning objectives, intended audience, and prerequisite background. Phrase objectives as "By the end of this tutorial, you'll be able to {verb}…"; define them *before* writing content so they bound what's in/out of scope.
- **Background:** Optional context to set up the lesson. For a feature tutorial, explain the feature; for a project tutorial, describe the starter project's hierarchy and what's provided vs. what the user adds.
- **Before you start:** List concrete prerequisites (OS, languages, package managers, software, access) so nobody gets halfway in and stalls. Keep it scannable.
- **Steps:** Start each step with an imperative verb (not the -ing form — harder to translate) and a complete thought ("Set up access to a Cloud Storage bucket", not "Set up access"). Add explanatory text, then optional code/screenshot, then optional result. Test all code and add comments — learners copy-paste it. Cap at ~7 primary steps and ~4 substeps each; orient the user (which file/dialog) before the action.
- **Summary:** Restate the concrete skills gained, going deeper than the objectives rather than echoing them. Use it to motivate continued use.
- **Next steps:** Link related tutorials and resources (articles, blogs, videos) for further learning.
