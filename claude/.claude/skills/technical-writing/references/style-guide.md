# Technical Writing Style Guide

Based on The Good Docs Project, Google Developer Style Guide, and GitLab Documentation Style Guide.

## Core Principles

### Write for the audience

Before writing, consider:

- Who am I writing for?
- What does the audience already know?
- What questions might they have?
- What's the best outcome for the reader?

### Plain language

Write with words the audience can immediately understand on first read.

**Short sentences**: Every word must earn its place. If you can cut a word, cut it.

| Don't                                                                                                                       | Do                                                                                     |
| --------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| When the process of freeing a vehicle that has been stuck results in ruts or holes, the operator will fill the rut or hole. | If you make a hole while freeing a stuck vehicle, fill the hole before you drive away. |

**Simple tense**: Use present tense when possible.

| Don't                                                            | Do                                              |
| ---------------------------------------------------------------- | ----------------------------------------------- |
| To register a user, you will need to configure the system first. | To register a user, configure the system first. |

**Active voice**: Tell users what to do directly.

| Don't                                                                           | Do                              |
| ------------------------------------------------------------------------------- | ------------------------------- |
| Docker should be installed.                                                     | Install Docker.                 |
| If the Oracle instances haven't been configured yet, then they will need to be. | Configure the Oracle instances. |

**Avoid**: Metaphors, figures of speech, slang, jargon, and word clusters of more than 3 words.

### Information organization (Inverted pyramid)

Put the most important information first in pages, sections, and sentences.
Readers can decide at any point if the topic interests them and still leave with the main message.

**Goal first**: If writing about a goal, state it first.

| Don't                                                                              | Do                                                            |
| ---------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| Sign in to the console. Navigate to your bucket. Select Save to save the metadata. | To edit system-defined metadata: 1. Sign in to the console... |

**Location first**: Tell users where things happen.

| Don't                                     | Do                                                 |
| ----------------------------------------- | -------------------------------------------------- |
| Choose Edit metadata on the Actions menu. | On the **Actions** menu, choose **Edit metadata**. |

**Condition first**: If a condition applies to a subset of users, state it first so others can skip.

| Don't                                                                     | Do                                                                       |
| ------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| Use a high-resolution printer for color reproductions for local printing. | For printing color reproductions locally, use a high-resolution printer. |

## Voice and Tone

### By doc type

| Type       | Tone                    | Focus                           |
| ---------- | ----------------------- | ------------------------------- |
| Concept    | Thoughtful, explanatory | Understanding "why" and "what"  |
| How-to     | Direct, efficient       | Completing a specific task      |
| Reference  | Neutral, factual        | Looking up accurate information |
| Tutorial   | Encouraging, patient    | Learning by doing               |
| Quickstart | Energetic, minimal      | Getting started fast            |
| README     | Professional, welcoming | Evaluating and onboarding       |

## Formatting

### Headings

- Use sentence case: "Getting started" not "Getting Started"
- Keep headings short (under 8 words)
- Use heading levels consistently (don't skip ## to ####)
- Start procedural headings with verbs: "Configure the database"
- Make titles descriptive and unique

### Code

- Inline code: file names, commands, function names, parameters, values
- Code blocks: multi-line code, terminal output, configuration files
- Always specify language: \`\`\`python, \`\`\`bash, \`\`\`yaml
- Include comments when helpful

### Lists

**Numbered lists**: Use for sequential steps or anything requiring order.

**Bullet lists**: Use when order doesn't matter.

**Best practices**:

- Always introduce lists with a complete sentence
- Use parallel phrasing (same structure for all items)
- Use Oxford comma for inline lists with 3+ items
- Start each item with a capital letter
- No periods for short items; periods for full sentences

| Don't                                                                       | Do                                              |
| --------------------------------------------------------------------------- | ----------------------------------------------- |
| Things I eat: I eat chocolate. Nutella. The other day I also ate ice cream. | Things I should eat: Vegetables. Beans. Fruits. |

### Links

**Descriptive text**: Help users decide whether to follow the link before clicking.

| Don't                             | Do                                                      |
| --------------------------------- | ------------------------------------------------------- |
| For more information, click here. | For more information about adding links, see Add links. |

**Placement**:

- Essential links: Place in the step where needed
- Supporting links: Place in a "See also" or "Related" section at the bottom

**Wiki-links**:

- Internal docs: `[[configuration-guide]]`
- Specific sections: `[[doc-name#section]]`
- Display text: `[[doc-name|Display Text]]`

### Tables

Use tables when:

- Information has 2+ parts whose relationship is best shown in a table
- Tabular format highlights information better than a list
- A clear pattern avoids repeating words

Always include:

- Introductory sentence (unless heading is sufficient)
- Header row with sentence case

Prefer lists over tables when possible due to Markdown table limitations.

### Notes and callouts

Use sparingly (roughly one per topic). Place notes **before** the content they relate to.

```markdown
> [!note]
> Helpful additional information.

> [!tip]
> Optional suggestion for better results.

> [!warning]
> Critical information to avoid problems.
```

## Writing Procedures

### Step structure

For procedures with many steps, chunk into sub-sections of 5-10 steps.

```markdown
1. {Action verb to start.}

   {Optional: Explanatory text}

   {Optional: Code sample or screenshot}

   {Optional: Expected result}

2. {Action verb to start.}

   a. {Substep 1}

   b. {Substep 2}
```

**Best practices**:

- Each step is a single, grammatically complete sentence
- Include lead-in sentences before sub-steps
- Aim for no more than 4 sub-steps per primary step
- If indenting beyond one level, break into a new step block
- Mark optional steps: "Optional: Enter a description."
- Use conditional format: "If you are a Windows user, install VirtualBox."

## Consistency

### Terminology

- Always use the same term for the same thing
- Avoid using "username" and "user ID" interchangeably
- Match UI capitalization when referring to UI elements
- Check product/feature capitalization against official sources

### Abbreviations

- Spell out on first use: "Application Programming Interface (API)"
- Exception: Industry-standard acronyms (URL, TCP/IP, WWW)
- Avoid creating unnecessary abbreviations

### Word choice

| Instead of   | Use         |
| ------------ | ----------- |
| In order to  | To          |
| Utilize      | Use         |
| Prior to     | Before      |
| Subsequently | Then        |
| Terminate    | End/Stop    |
| Initiate     | Start       |
| Leverage     | Use         |
| Facilitate   | Help/Enable |

## Markdown Frontmatter

### Frontmatter Format

```yaml
---
type: knowledge
topic: brief-topic-name
tags: [knowledge, doc-type, relevant-tags]
created: YYYY-MM-DD
updated: YYYY-MM-DD
---
```

## Quality Checklist

Before finalizing any document:

- [ ] Title clearly describes content and is unique
- [ ] Frontmatter is complete and accurate
- [ ] Structure matches doc type
- [ ] Most important information comes first
- [ ] Steps start with action verbs
- [ ] Lists have introductory sentences and parallel structure
- [ ] No broken wiki-links
- [ ] Code examples are accurate
- [ ] Acronyms spelled out on first use
- [ ] Consistent terminology throughout
- [ ] Related docs are linked

## References

- [The Good Docs Project](https://thegooddocsproject.dev/)
- [Google Developer Style Guide](https://developers.google.com/style)
- [GitLab Documentation Style Guide](https://docs.gitlab.com/ee/development/documentation/styleguide)
- [Plain Language](https://www.plainlanguage.gov)
