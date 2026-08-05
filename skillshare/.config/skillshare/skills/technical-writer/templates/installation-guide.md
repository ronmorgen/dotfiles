# Installation Guide — step-by-step instructions for installing, configuring, and verifying a product

**Use when:** A user needs to get the product installed and set up (OS, app, plugin, SaaS, OSS, SDK, or hardware) — system requirements, prerequisites, install steps, verification, upgrade/uninstall.
**Don't use when:** You're explaining how to *do a task* with an already-installed product (write a how-to/tutorial instead) or diagnosing a runtime failure (use **troubleshooting**). Installs the product; doesn't operate it.
**Audience & voice:** Sysadmins and technically capable users. Imperative, procedural; numbered steps starting with an active verb; state the expected result of each step.

## Skeleton

```
# {Title}

## Introduction
{Purpose of the guide and a description of the install process for {product name}. Optional: demo GIF / sandbox link.}

## Installation types
{Intro sentence, then a table of the install scenarios — supported OSes, product variants (Main/Lite), cloud providers — each linking to its steps.}

| **Type** | **Description** | **More information** |
| -------- | --------------- | -------------------- |
| {Install type} | {Description} | {Link to steps section} |

## Overview
{Optional. Available versions table (version, build, date, status: Latest/Beta/Stable). State the intended result of installing — commands, aliases, flags, plugins, files. Add a sequential end-to-end summary table of the whole process with links.}

## System requirements
{Requirements per installation type (product/OS/cloud). Can be structured in reverse: install type as heading, its requirements as sub-section.}

## Before you begin
Before installing {version number}, ensure you have:
* {Prerequisite one}
* {Prerequisite two}
{List prerequisites for all install types — dependencies, required versions, specialist knowledge. Consider a per-type table.}

## Installation steps
{Short intro per install type.}
### Step 1 - {one-sentence description}
{Optional intro text. Sequence of instructions. Optional: code snippet/screenshot. Optional: show the result of the step.}
#### 1.1. Substep 1 - {one-sentence description}
### Step 2 - {one-sentence description}

## Verify installation
{Test commands, intended outputs, or other steps confirming success.}

## Post installation
### Configuration options
{Post-install config requirements; link to relevant docs.}
### Upgrade options
{How to install updates; link to available versions with dates/features.}
### Downgrade options
{How to downgrade, if supported.}
### Uninstallation options
{How to uninstall the product.}

## Troubleshooting
### {Problem title}
{Optional: detail of the problem and its cause(s).}
**Solution**: {Solution.}
**Contact**: {Support/contact info.}

## Next steps
{Recommended actions after install; links to further docs; support contact.}

## Product version history
{Table of major changes using Major.Minor.Patch semantic versioning.}

## Definition of terms
{Optional glossary table of terms, acronyms, abbreviations.}

| **Term** | **Meaning** |
| -------- | ----------- |
| {Term} | {Definition} |
```

## Filling tips

- **Introduction:** State the purpose; optionally call out benefits (performance, stability, security). Link a demo or sandbox so users see the end state before committing.
- **Installation types:** Use a table only if the product installs differently across variants, OSes, or cloud hosts. Add an intro sentence and link each row to its own steps so users self-select the right path.
- **Overview:** Optional but useful for big installs. Describe the concrete result (commands, files, plugins) and give a numbered end-to-end summary table that doubles as a quick-reference and links into each phase.
- **System requirements:** Break out per install type. Flip the hierarchy (type → requirements) when that reads more naturally than (requirements → type).
- **Before you begin:** List everything needed up front — dependencies, minimum versions, required skills. A per-type prerequisites table prevents users from starting a path they can't finish.
- **Installation steps:** Numbered, one active verb per step, one-sentence step descriptions. State the expected result and a success check (or recovery tip) after each step. Note install options but flag the recommended path. Add visuals and code blocks where they help.
- **Verify installation:** Give a concrete test command and the output a healthy install produces — don't make users guess whether it worked.
- **Post installation:** Cover config, upgrade, downgrade, and uninstall. Keep each brief and link to fuller docs; anticipate problems users hit right after installing.
- **Troubleshooting:** Anticipated problem → cause → solution, with contact info. Warn prominently for any action with security impact. Keep in sync with engineering.
- **Next steps:** Point to the first thing to do with the now-installed product and to deeper docs; include support/feedback channels.
- **Product version history & terms:** Track changes with semantic versioning and keep it consistent across docs. Glossary is optional — include only terms a reader of *this* guide will hit.
