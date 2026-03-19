---
name: commit
description: Generate a git commit using conventional commits format. Stages files, writes a well-formed commit message, and optionally pushes. Use when the user asks to commit, /commit, stage changes, or push code.
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git commit:*), Bash(git push:*), Bash(git log:*), Bash(git diff:*),Bash(git switch:*)
---

## Context

- Git status: !`git status --short`
- Staged + unstaged diff: !`git diff HEAD`
- Current branch: !`git branch --show-current`
- Recent commits (for style reference): !`git log --oneline -5`

## Task

**If on `main` or `master`:** Before doing anything else, run `git switch -c <branch-name>` to create and switch to a new feature branch. Derive the branch name from the changes (e.g. `fix/zsh-compinit`, `feat/add-auth`). Do not ask — just switch automatically.

In a **single message**, do all the following in parallel tool calls:

1. **Stage files** — run `git add` on all modified/new files. Never stage: `.env`, `*.pem`, `*.key`, `*secret*`, `*credential*`, `*password*`
2. **Commit** — use conventional commits format (see below)

If the user explicitly asked to push, also push in the same message.

## Conventional Commits Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer]
```

**Type** — pick the most specific:

| Type       | When                                     |
| ---------- | ---------------------------------------- |
| `feat`     | New feature or capability                |
| `fix`      | Bug fix                                  |
| `refactor` | Code change that is neither feat nor fix |
| `perf`     | Performance improvement                  |
| `test`     | Adding or fixing tests                   |
| `docs`     | Documentation only                       |
| `chore`    | Build, deps, config, tooling             |
| `ci`       | CI/CD pipeline changes                   |
| `style`    | Formatting, whitespace (no logic change) |
| `revert`   | Reverts a previous commit                |

**Rules:**

- Description: imperative, lowercase, no period, ≤72 chars (`add user auth`, not `Added user auth.`)
- Scope: lowercase noun in parens, e.g. `feat(auth):`, `fix(api):`
- Breaking change: append `!` after type/scope — `feat(api)!:` — and add `BREAKING CHANGE: <details>` footer
- Body: wrap at 72 chars, explain _why_ not _what_
- Multi-change commits: use the dominant change type; list others in the body

## Output

Do not print anything. Only make tool calls.
