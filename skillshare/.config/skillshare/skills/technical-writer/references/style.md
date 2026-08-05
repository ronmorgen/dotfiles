# Style rules

Distilled from The Good Docs Project `STYLE-GUIDE.md` and `writing-tips.md`. Apply
these to every draft regardless of content type. When this guide is silent, defer
to the Google developer documentation style guide, then Microsoft's.

## Voice and tone

- **Active voice.** "Run the migration," not "The migration should be run."
- **Second person, present tense.** Address the reader as "you." "The CLI returns
  a token," not "The CLI will return a token."
- **Imperative for instructions.** Start steps with a verb: "Select," "Enter," "Run."
- **No marketing.** Drop "easily," "simply," "powerful," "seamless," "just." If a
  step is genuinely simple, the brevity shows it; saying so insults a stuck reader.
- **No opinions.** State facts; let readers conclude. Don't editorialize about
  other tools or approaches.
- **Be consistent.** One term per concept throughout — don't alternate
  "sign in" / "log in" / "authenticate" for the same action.

## Plain language

- Short sentences; one idea each. If you can't read it aloud in one breath, split it.
- Prefer common words over jargon and Latinisms ("use" over "utilize," "to" over
  "in order to"). Jargon and colloquialisms slow non-native English readers.
- Define a term on first use, then reuse it. For a term repeated across a long
  page, define it once near the top.
- Spell out acronyms on first use: "single sign-on (SSO)." Use the acronym after.
- Cut filler: "in order to" → "to," "at this point in time" → "now," "a number of"
  → "several" (or the actual count).

## Procedural steps

- One action per step; each step is a single sentence that's grammatically whole.
- Steps start with a verb in the order the reader performs them (find the thing,
  then act on it: "In **Settings**, select **Keys**," not "Select Keys in Settings").
- Chunk long procedures into sub-sections of 5–10 steps under task headings —
  easier to scan, remember, and resume.
- Add a lead-in sentence before a sub-step list reminding the reader of the goal.
- Max four sub-steps per primary step; if you need more or a second indent level,
  promote them to their own step block or section.
- **Optional steps:** prefix with "Optional:" — e.g. "Optional: Enter a description."
- **Conditional steps:** lead with the condition so readers who don't match can
  skip — "If you use Windows, install VirtualBox."
- Show expected results and use screenshots with callouts for UI steps.

## Page structure

- Outline the headings before writing — it's cheaper to reorder headings than prose.
- One topic per page. If the subject branches, split into two pages (and the right
  content types — see `content-type-map.md`).
- Headings are descriptive and scannable; readers skim before they read.
- Collect every inline link into a **See also** / **Next steps** section at the end;
  inline links get lost and add cognitive load.

## Titles and filenames

- Title describes the content and is unique within the doc set.
- Title and filename match. Use lowercase, hyphenated filenames:
  "Toast a slice of bread" → `toast-slice-of-bread.md`.
- Use distinctive words so later search-and-replace doesn't fuzzy-match.

## Formatting conventions

- **Lists:** parallel phrasing — every item starts the same grammatical way.
  Numbered for sequence/ordered steps, bulleted for unordered sets.
- **Tables:** for structured lookup (fields, parameters, commands). Keep cells terse;
  give every column a header.
- **Notes/warnings:** place a note immediately before the step it affects, not after.
  Reserve warnings for data loss or irreversible actions; overuse dulls them.
- **Code:** make samples copy-pasteable and runnable; show real values, not
  `<foo>` where a concrete example helps. Label the language for syntax highlighting.

## Accessible and inclusive writing

- Meaningful link text — never "click here." The link text should make sense out
  of context.
- Describe images in alt text; don't put information only in a screenshot.
- Use inclusive, bias-free language; avoid idioms that don't translate and
  ableist/gendered defaults.
