# Pre-delivery checklist

Run every draft through this before handing it over. Anything unchecked is a defect.

## Type and scope
- [ ] The content type matches the reader's situation (see `content-type-map.md`) —
      one type per document; no tutorial/reference/concept mixing.
- [ ] Every `{curly-bracket}` placeholder from the skeleton is replaced or
      deliberately deleted — none ship to the reader.
- [ ] Audience and prerequisites are stated up front (level, role, prior knowledge,
      required access/software).

## Accuracy and completeness
- [ ] Steps are in the order performed and actually achieve the stated goal.
- [ ] Code samples are runnable, syntactically valid, and use realistic values.
- [ ] Commands, paths, flags, and outputs match the real product.
- [ ] Expected results / outputs are shown so readers can confirm success.
- [ ] No invented APIs, fields, or behavior — flag anything you couldn't verify.

## Style (see `style.md`)
- [ ] Active voice, second person, present tense; imperative steps.
- [ ] No marketing fluff ("easily," "simply," "powerful") and no opinions.
- [ ] One term per concept; acronyms spelled out on first use; jargon defined.
- [ ] Sentences are short and single-idea; long procedures chunked to 5–10 steps.
- [ ] Optional/conditional steps marked; conditions lead the step.

## Structure and navigation
- [ ] Descriptive, scannable headings; outline reads sensibly on its own.
- [ ] Lists use parallel phrasing; tables have headers and terse cells.
- [ ] Links use meaningful text (never "click here"); inline links also gathered
      into a See also / Next steps section.
- [ ] Title and (if saved) filename match and are lowercase-hyphenated.

## Accessibility
- [ ] Images have alt text; no information lives only inside a screenshot.
- [ ] Notes/warnings sit before the step they affect; warnings reserved for
      irreversible or data-loss actions.

## Hand-off
- [ ] Companion content types the reader will likely need next are named
      (e.g. a how-to's matching reference, a concept's matching tutorial).
