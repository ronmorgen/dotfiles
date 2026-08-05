# Reference — structured lookup of fields, settings, and commands

**Use when:** Users need to quickly scan for specific, concise facts about components — config settings, fields, CLI commands, arguments, return values — organized to mirror the application's structure.
**Don't use when:** The reader needs to understand *why* something exists or how it fits the bigger picture (use a concept) or needs step-by-step guidance (use a how-to or tutorial). Keep procedural/instructional content out of a reference.
**Audience & voice:** Users unfamiliar with the problem space who need clarification on settings, commands, and arguments — scanning, not reading. Dry, terse, consistent, active voice; present tense. Lookup-oriented, no narrative. (Note: a *reference* differs from an *API reference*, which targets domain experts with endpoint/parameter detail.)

## Skeleton

```
## {Reference description}
{Structured list of settings, field descriptions, and reference details. Can stand
alone or complement other docs (often at the end of a procedure). Define the scope
of this reference and how it relates to other documents.}

## {Table name or other structured entry}
{Pick the format that best organizes the data: tables for structured info, lists for
quick references, code blocks for readability. Be consistent. Order entries to match
the order in the reference material.}

| Field | Description | Example |
| ----- | ----------- | ------- |
| {field} | {what it is / does} | {example value} |

## (Optional) Commands
{Short description, with code or code blocks as needed.}

| Command | Description | Argument | Example |
| ------- | ----------- | -------- | ------- |
| {command name} | {what it does} | {optional / required} | {example config} |
```

## Filling tips

- **Reference description:** Concisely summarize the article's content, purpose, and scope. Keep it brief but informative — highlight the key themes or functionality covered and how this reference relates to other docs. Avoid detail that overwhelms.
- **Table / structured entry:** Choose tables, lists, or object schemas (attributes, objects) — whatever organizes the data most clearly, and stay consistent. Order entries to match the source material so they're easy to locate. Write descriptions in active voice; aim for completeness without unnecessary complexity.
- **Commands:** Optional. Present command info consistently using tables (for structured details), lists (quick reference), or code blocks (readability). Mark each argument optional or required, and show examples of the command under different configurations.
- **Overall:** Keep it task-oriented and consistent in structure, terminology, and tone. Strip out high-level usage instructions, conceptual explanation, and any irrelevant detail — those belong in concept or how-to docs and only frustrate scanners here.
```
