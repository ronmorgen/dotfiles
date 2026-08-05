# Release Notes — user-facing summary of what changed in a specific version, and why it matters

**Use when:** A product/feature release ships and stakeholders (customers, support, sales, users) need a plain-language account of new features, improvements, bug fixes, known issues, and deprecations for that version.
**Don't use when:** You want a developer-facing, commit-level changelog (different artifact), step-by-step setup (**installation-guide**), symptom→fix help (**troubleshooting**), or project orientation (**readme**). Reports what changed; doesn't teach how to use it.
**Audience & voice:** Mixed technical/non-technical stakeholders. Positive, friendly, plain language; second person ("you"); present tense — except bug fixes, which use past tense. Lead each item with the user benefit, link to full docs as the source of truth.

## Skeleton

```
# Release notes - {Product name} {Release number - 0.0.0}

{Optional: Release notes version - 0}
{Release date - YYYY-MM-DD}
{Optional: High-level summary — 1-2 sentences on the most important items.}

## New features
* **{Feature name}**
   {Feature description — what you can now do, the benefit, link to full docs.}

## New features requiring configuration updates
* **{Feature name}**
   {Feature description, the nature of the required config update, link to config + feature docs.}

## Improvements
* **{Improvement title}**
   {What was added/updated/removed, the benefit, link to docs.}

## API/Web service updates
* **{API/Web service update}**
   {Update description.}

## Bug fixes
* **{Bug fix title}**
   {What was fixed and why it matters; past tense; optional [issue number] + link.}

### Known issues
* **{Known issue title}**
   {The scenario/problem, an example, a workaround if any; optional [issue number] + link.}

## Optional: Deprecation notice
* **{Deprecated feature name}**
   {What's deprecated, removal date, replacement, action the user must take, link to docs.}
```

## Filling tips

- **Title:** Match the product release number (semantic versioning, e.g. 1.3.2) so stakeholders know which release this describes. If you publish on a date cycle, add the date as YYYY-MM-DD.
- **Release notes version (optional):** Bump this if you edit the notes after publication.
- **High-level summary (optional):** 1-2 sentences highlighting the biggest items; valuable for long notes, skippable if you already communicate frequently outside the release cycle.
- **New features:** Most-impactful first, from the stakeholder's POV. Engaging concise title, describe the *benefit* (why it's valuable), add screenshots/video if they help, and link to full docs as source of truth — keep the inline description brief.
- **New features requiring config updates:** Same as new features, plus describe the nature of the configuration change and link to the relevant config docs so users can enable it.
- **Improvements:** Updates to existing features (some teams call this "Enhancements"). Most-impactful first; lead with benefit; link to docs.
- **API/Web service updates:** Note endpoint/contract changes relevant to integrators.
- **Bug fixes:** Say what's better, not how it was coded. Don't open every line with "Fixed the bug…"; contrast prior vs. current behavior; use past tense; optionally include and link the issue number for support traceability.
- **Known issues:** Unresolved problems that may affect users. Describe the scenario, give an example, offer a workaround, optionally link the tracking issue so stakeholders can follow progress.
- **Deprecated features (optional):** Name the feature (link its docs), the removal date, the replacement, and any data-preserving action the user must take; optional issue link.
