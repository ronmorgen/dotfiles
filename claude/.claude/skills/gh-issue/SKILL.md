---
name: gh-issue
description: End-to-end workflow for creating GitHub issues with the gh CLI — drafting quality titles and bodies, then posting non-interactively. Use this skill whenever the user asks to create, file, or open a GitHub issue, log a bug to a GitHub repo, or track something as a GitHub issue. Trigger even if they just describe a problem and haven't explicitly said "create an issue" — if it sounds like they want to track it in GitHub, use this skill.
---

# GitHub Issue Creation

## The critical rule: always run non-interactively

`gh issue create` without `--title` and `--body` opens an interactive editor. In Claude Code that prompt hangs forever. Always pass both flags:

```bash
gh issue create \
  --title "Fix login timeout after session expiry" \
  --body "$(cat <<'EOF'
## Description
...
EOF
)"
```

Or write the body to a temp file first (cleaner for long bodies):

```bash
cat > /tmp/issue-body.md << 'EOF'
## Description
...
EOF

gh issue create --title "..." --body-file /tmp/issue-body.md
```

## Confirm before creating

GitHub issues are visible to the whole team the moment they're posted and can't be cleanly recalled. Before running `gh issue create`, show the user the full title and body and wait for an explicit go-ahead. Creating without confirmation is the main mistake to avoid.

## Writing the title

Issue titles should read as a self-contained sentence — what the problem or work is, in plain English. A teammate who's never heard of the issue should understand it at a glance from the title alone.

| Avoid                   | Prefer                                             |
| ----------------------- | -------------------------------------------------- |
| `feat: add retry logic` | `Add retry logic for failed API calls`             |
| `fix/login-bug`         | `Fix login timeout after session expiry`           |
| `bug - broken`          | `API returns 500 when user has no billing address` |

No `feat:`, `chore:`, `fix:` prefixes. No branch slugs. Sentence case.

## Writing the body

Match the body structure to the issue type:

**Bug:**

```markdown
## Description

What's broken and what impact it has.

## Steps to reproduce

1. ...
2. ...

## Expected behavior

...

## Actual behavior

...

## Environment

OS, version, relevant config.
```

**Feature request:**

```markdown
## Problem

Why this is needed — the use case driving it.

## Proposed solution

What you'd like to happen.

## Alternatives considered

Other approaches you ruled out.
```

**Task / chore:**
A short paragraph is enough. Describe what needs to happen and why. Skip the headers if the issue is simple.

## Discovery before creating

If labels or milestones need to be set, look them up first — names must match exactly:

```bash
gh label list                   # see available labels
gh milestone list               # see available milestones
```

Then add to the create command:

```bash
gh issue create \
  --title "..." \
  --body-file /tmp/issue-body.md \
  --label "bug" \
  --label "high priority" \
  --assignee "@me" \
  --milestone "Q2 cleanup"
```

## Cross-repo issues

`gh issue create` defaults to the current directory's repository. To file against a different repo:

```bash
gh issue create -R owner/repo --title "..." --body "..."
```
