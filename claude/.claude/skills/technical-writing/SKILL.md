---
name: technical-writing
description: This skill should be used when creating technical documentation such as concepts, how-tos, READMEs, reference docs, tutorials, or quickstarts. It provides writing guidelines, style conventions, and templates for each documentation type based on The Good Docs Project standards. Use this skill when the user asks to write, create, or draft technical documentation.
---

# Technical Writing Skill

Create clear, consistent technical documentation following the Diátaxis framework, The Good Docs Project standards, and established style conventions.

## Quick Start

1. **Identify doc type** from the table below
2. **Read the template** from `assets/templates/{type}.md`
3. **Apply style guide** from `references/style-guide.md`
4. **Replace placeholders** marked with `{curly brackets}`
5. **Add frontmatter** and wiki-links

## Documentation Types (Diátaxis Framework)

Select based on the reader's goal and situation:

| Type           | Reader's Question            | Reader's State | Focus             |
| -------------- | ---------------------------- | -------------- | ----------------- |
| **Concept**    | "What is X?"                 | Studying       | Understanding     |
| **How-to**     | "How do I do X?"             | Working        | Completing a task |
| **Reference**  | "What are the details of X?" | Working        | Looking up info   |
| **Tutorial**   | "How can I learn X?"         | Learning       | Building skills   |
| **Quickstart** | "How do I get started fast?" | Evaluating     | First success     |
| **README**     | "What is this project?"      | Evaluating     | Deciding to use   |

### Decision Tree

```text
Is the reader trying to LEARN something new?
├── Yes → Is it hands-on with a concrete outcome?
│         ├── Yes → TUTORIAL
│         └── No → CONCEPT
└── No → Is the reader trying to DO something specific?
         ├── Yes → Is it their first time getting started?
         │         ├── Yes → QUICKSTART
         │         └── No → HOW-TO
         └── No → Is it looking up specific details?
                  ├── Yes → REFERENCE
                  └── No → README (project overview)
```

## Key Writing Principles

### Inverted Pyramid

Put the most important information first. Readers may leave at any point and should still get the main message.

- **Pages**: Lead with the key takeaway
- **Sections**: Start with the conclusion, then details
- **Sentences**: Goal/condition/location comes before the action

### Plain Language

- Use short sentences (every word must earn its place)
- Use active voice ("Install Docker" not "Docker should be installed")
- Use present tense ("Configure the server" not "You will need to configure")
- Avoid jargon, metaphors, and word clusters of 3+ words

### Procedures

- Start each step with a verb
- One action per step
- Chunk long procedures into 5–10 step sections
- Include expected results after commands
- Mark optional steps explicitly: "Optional: Configure logging"

## Markdown Integration

All documents must include proper frontmatter:

```yaml
---
type: knowledge
topic: { brief-topic-name }
tags: [knowledge, { doc-type }]
created: YYYY-MM-DD
updated: YYYY-MM-DD
---
```

Use markdown features:

- Relative links: `[Display Text](./path/to/file.md)`
- Section links: `[Section](./file.md#section-name)`
- Note blocks: Use block quotes with indicators like `> Note:`, `> Tip:`, `> Warning:`

## Resources

| Resource            | Location                         | Purpose                                           |
| ------------------- | -------------------------------- | ------------------------------------------------- |
| Style Guide         | `references/style-guide.md`      | Writing conventions, formatting rules, checklists |
| Concept Template    | `assets/templates/concept.md`    | Explanatory documentation                         |
| How-to Template     | `assets/templates/how-to.md`     | Task-oriented guides                              |
| Tutorial Template   | `assets/templates/tutorial.md`   | Learning-oriented guides                          |
| Quickstart Template | `assets/templates/quickstart.md` | Getting started fast                              |
| Reference Template  | `assets/templates/reference.md`  | API/technical specs                               |
| README Template     | `assets/templates/readme.md`     | Project overviews                                 |

## Quality Checklist

Before finalizing:

- [ ] Doc type matches reader's goal
- [ ] Title clearly describes content
- [ ] Most important information comes first
- [ ] Steps start with action verbs
- [ ] All placeholders replaced
- [ ] Frontmatter complete
- [ ] Internal links working
- [ ] Code examples accurate
- [ ] Related docs linked
