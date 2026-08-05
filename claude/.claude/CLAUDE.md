# Claude Code Configuration

## Principles

- **Minimal change**: Touch only what's necessary. Simplest solution that fully solves the problem.
- **Edit scope**: When editing an existing file, change only what was asked. Don't restructure, reformat, or rewrite surrounding content. For anything beyond a targeted edit, show the exact lines you'll touch and confirm first.
- **Root cause only**: Always find and fix the root cause. No temporary fixes, no workarounds, no TODOs for later. If the fix is large, explain the scope and get approval — but still fix the root cause.
- **Read before writing**: Never propose changes to code you haven't read. Understand context first.

## Communication

- Skip pleasantries. Lead with the answer or action.
- When using subagents, state what each is doing.
- Batch independent tool calls in parallel.

## Planning & Approval

- **Trivial changes** (single-purpose, ≤3 steps, no architectural decisions): execute directly.
- **Nontrivial changes** (>3 steps, architectural decisions, or ambiguous requirements): describe your approach and wait for approval before writing code.
- **Large changes** (>3 files): stop, break into smaller tasks, and propose the breakdown first.

## Code Quality

- After writing code, list what could break and suggest tests.
- When fixing a bug: write a failing test first, then fix until it passes.
- **No trial-and-error loops**: If a linter/formatter/compiler won't cleanly pass after 2 attempts, stop. Don't stack hacky fixes (noqa, whitespace nudges). Diagnose the root cause and propose a config/rule change instead.

## Lessons

- When corrected, add or update a lesson in this section. Iterate on existing lessons rather than duplicating. Remove lessons once the mistake no longer occurs.
