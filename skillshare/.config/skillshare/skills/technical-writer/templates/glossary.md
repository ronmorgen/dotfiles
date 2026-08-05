# Glossary — define domain-specific terms and abbreviations

**Use when:** A project, team, or industry uses jargon, acronyms, or terms with multiple/conflicting meanings that readers need defined in one place — a shared "cheat sheet" for terminology.
**Don't use when:** You need to *explain* a single idea in depth (use a concept) or *catalog* settings/commands (use a reference). Also skip terms already covered by an established dictionary unless they carry a special meaning for your project. For rich term metadata (related terms, provenance, localization), use a terminology system instead.
**Audience & voice:** New contributors, users, and translators who need quick, unambiguous meanings. Neutral and concise; each definition 1-3 sentences. Definition-oriented lookup.

## Skeleton

```
| Term | {Optional} Abbreviation | Definition | {Optional} Source |
| ---- | ----------------------- | ---------- | ----------------- |
| {term} | {abbreviation} | {definition} | {source} |
```

Example entry:

```
| application programming interface | API | An API is a set of defined rules that
enable different applications to communicate with each other. | https://www.ibm.com/topics/api |
```

## Filling tips

- **Term:** Include only terms with a meaning specific to your audience, industry, or org — not general-dictionary words. Mine existing source docs for common terms and acronyms, and ask the audience which terms are undefined or unclear. Decide upfront whether the glossary is private or public.
- **Abbreviation:** Optional. Add the term's acronym or abbreviation if it has one.
- **Definition:** Keep it to one to three sentences. If an authoritative definition exists (e.g., a dictionary) and matches your team's usage, reuse it; otherwise write your own.
- **Source:** Optional. Link to the definition's source whenever you didn't write it yourself.
- **Overall:** Before starting, check no existing glossary can be revised, identify your audience, and confirm the audience's knowledge level actually needs a glossary. Keep entries consistent and machine-readable if you want hover-over popups or translation support.
```
