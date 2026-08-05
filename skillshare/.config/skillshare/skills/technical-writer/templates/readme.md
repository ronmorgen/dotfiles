# Readme — the project's front door: what it is, who it's for, and how to start

**Use when:** A project needs a root-folder first impression — what it does, why a user should care, who it's for, dependencies, and how to install/configure/run it.
**Don't use when:** You need an exhaustive install walkthrough (link to an **installation-guide**), a deep symptom→fix reference (link to **troubleshooting**), or a version-by-version change log (**release-notes**). Orients newcomers; doesn't replace dedicated docs.
**Audience & voice:** Anyone evaluating or starting with the project. Approachable, friendly, active voice; strong verbs ("build," "discover," "instruct"); succinct — lead with *why they'd care*, not the tech stack. Name the file `README.md` in all caps.

## Skeleton

```
## {Project} logo and badges
{Optional. Project logo image and status/health/social badges.}

## {Project Name}
{H1-prominent name. Optional: project URL and owner name beneath.}

## Table of contents
{Optional; useful for long READMEs. (GitHub auto-generates one for .md files.)}

## Project description
{What it does and why a user should care — before any tech/tools. Optional: limitations, when NOT to use it. Optional: screenshots/demo videos that live in the repo.}

With _{Project Name}_ you can _{verb}_ _{noun}_...
_{Project Name}_ helps you _{verb}_ _{noun}_...
Unlike _{alternative}_, _{Project Name}_ _{verb}_ _{noun}_...

## Who this project is for
This project is intended for {target user} who wants to {user objective}.

## Project dependencies
Before using {Project Name}, ensure you have:
* {Prerequisite 1}
* {Prerequisite 2}

## Instructions for using {Project Name}
Get started with {Project Name} by {first step — start with a verb}.

### Install {Project Name}
1. {Step.} {Explanatory text. Optional: code sample/screenshot.}

### Configure {Project Name}
1. {Step.}

### Run {Project Name}
1. {Step.}

### Troubleshoot {Project Name}
{Numbered steps and/or an Issue/Solution table.}

| Issue | Solution |
| ----- | -------- |
| {Issue} | {Solution} |

Other troubleshooting supports:
* {Link to FAQs / runbooks / other support}

## Contributing guidelines
{Link to your contributing guide, or summarize inline for small projects.}

## Additional documentation
{Links + brief descriptions to further docs.}

## How to get help
{Links + brief descriptions to support channels.}

## Terms of use
{Project Name} is licensed under {link to license file}.
```

## Filling tips

- **Logo & badges:** Optional. A logo aids visual recognition; badges (build status, health, social) add credibility and signal the project is maintained.
- **Project name:** Make it prominent as the H1. Optionally add URL and owner — but for anything beyond a tiny project, put people in a separate team/contact doc.
- **Table of contents:** Only for long READMEs. GitHub auto-generates one for Markdown, so you often don't need to hand-write it.
- **Project description:** The most important section. Say what it does and *why the user should care* before mentioning languages, tools, or tech. Optionally note limitations or when not to use it. Use the "With/helps you/Unlike" formulas; keep media in-repo.
- **Who this project is for:** Name the target users and the problems/tasks the project solves for them.
- **Project dependencies:** List prerequisites (software, environments, auth, prior knowledge) with links to install resources, and briefly say why each is needed.
- **Instructions:** Procedural, ordered steps starting with a verb, grouped into Install / Configure / Run / Troubleshoot. Link out to Quickstart or full installation docs rather than duplicating them.
- **Troubleshoot:** Use an Issue/Solution table for common problems and link to FAQs/runbooks for the rest — keep deep diagnostics in a dedicated troubleshooting doc.
- **Contributing:** Link to the contributing guide; inline a short summary only if the project is small.
- **Additional documentation / How to get help:** Provide links with brief descriptions — websites, examples, roadmap, known bugs, sub-READMEs (docs); mailing lists, chat channels, bug trackers, Stack Overflow (help).
- **Terms of use:** State the license and link to the license file.
- **General:** Revisit the README as the project grows so new users always find current info; reorder/remove sections that don't apply.
