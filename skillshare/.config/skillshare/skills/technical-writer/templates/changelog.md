# Changelog — A dated, reverse-chronological log of every notable code change per release

**Use when:** You need a comprehensive, technical record of what changed in each release — additions, fixes, deprecations, security patches, breaking changes — for developers and people who track code-level detail.
**Don't use when:** You want a high-level, plain-language summary of features and fixes for a broad (including non-technical) audience — write user-facing release notes instead. Changelogs are exhaustive and developer-focused; release notes are narrow and benefit-focused.
**Audience & voice:** Technical product users and developers. Terse, factual, technical. Each entry starts with a past-tense verb (Added/Fixed/Improved/Removed). Reverse-chronological by version; newest at top.

## Skeleton

```
## {MAJOR.MINOR.PATCH} - {YYYY-MM-DD}
{Version first. Use SemVer for the number and ISO 8601 (YYYY-MM-DD) for the date.}

## Release highlights
{Bulleted overview of the most important changes in this release.}
* {Feature Name}: {1-2 sentence summary}

## Added
{New features added since the last release.}
* {Feature description} {[Commit number](url)} {[Contributor handle](url)}

## Changed
{Changes to existing functionality.}
* {Feature description} {[Commit number](url)} {[Contributor handle](url)}

## Deprecated
{Features deprecated this release; name the recommended alternative.}
* {Feature description} {[Commit number](url)} {[Contributor handle](url)}

## Fixed
{Bugs fixed this release.}
* {Feature description} {[Commit number](url)} {[Contributor handle](url)}

## Security
{Resolved CVEs / security improvements; include the CVE ID.}
* {Feature description} {[Commit number](url)} {[Contributor handle](url)}

## Breaking changes
{Breaking changes; include upgrade instructions if users must act.}
* {Feature description} {[Commit number](url)} {[Contributor handle](url)}
```

## Filling tips

- **Version:** List the version number first, using SemVer (e.g. `18.2.8`) and an ISO 8601 date (`2024-10-10`). This is the industry-standard heading for each release block.
- **Release highlights:** Bulleted overview of the few most significant changes so developers grasp the release at a glance and end users spot key features/fixes. Each item is a 1-2 sentence summary; optionally link a blog post or announcement.
- **Added:** Describe each new feature briefly. Call out if it makes the app faster, more secure, or solves a known problem. Always link the associated PR/MR and commit.
- **Changed:** Describe modifications to existing behavior and the improvement (e.g. better error messages, faster load times). Link the PR/commit.
- **Deprecated:** Note what was deprecated, why, and the replacement to use instead, so users can migrate before removal.
- **Fixed:** Briefly describe the bug fixed and how the fix benefits the user. Link the issue/PR.
- **Security:** List resolved CVEs and security improvements with the CVE ID and a clear note on how the vulnerability affects users' systems. Report new CVEs to the CVE Program first to obtain an ID.
- **Breaking changes:** Cover deleted/added API resources, dependency changes, or altered function behavior. If users must upgrade, include the upgrade steps here.
- **General:** Early-stage projects may only need Added/Changed/Fixed; add the rest as the project grows. Every entry should link its merge/pull request. Frequent releases favor changelogs; infrequent ones may read better as release notes.
