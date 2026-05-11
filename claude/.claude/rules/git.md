# Git Workflow

## Branches

- Never commit directly to `main` or `master` — create a feature branch first.
- Branch off the latest `main` (`git switch main && git pull` before branching).
- Naming: `type/short-desc` using conventional-commit prefixes.
  - `feat/add-login`, `fix/login-redirect`, `chore/bump-deps`, `refactor/extract-auth`, `docs/readme-setup`, `test/login-edge-cases`
- One branch per logical unit of work. Don't pile unrelated changes onto an existing branch.

## Commits

- Conventional commits format: `type(scope): subject`
  - Types: `feat`, `fix`, `chore`, `refactor`, `docs`, `test`, `perf`, `build`, `ci`, `style`
  - Scope is optional but encouraged when it clarifies the area touched.
- One logical change per commit. Prefer several small, self-contained commits over one mixed commit.
- Subject: imperative mood, ≤72 chars, no trailing period.
- Body (when needed): explain the *why*, not the *what* — the diff already shows what.
- Stage files explicitly by name. Avoid `git add -A` / `git add .` unless every change is intended.

## Pull requests

- Title: under 70 chars, conventional-commit form (e.g., `feat(auth): add SSO login`).
- Body template:
  - `## Summary` — 1-3 bullets covering what changed and why.
  - `## Test plan` — markdown checklist of what was verified.
- Open as draft if the work is still in progress; mark ready when CI is green.
- Don't push to remote until the user explicitly asks.
