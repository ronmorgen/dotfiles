# Troubleshooting — diagnose symptoms and resolve failures with a product, feature, or task

**Use when:** Users hit errors, failures, or unexpected behavior and need to find the cause and a fix or workaround — organized symptom → cause → solution.
**Don't use when:** Nothing is broken yet — getting set up is an **installation-guide** job, orienting a newcomer to the project is a **readme** job, and "what changed this version" is **release-notes**. Diagnoses failures; doesn't install or introduce.
**Audience & voice:** Users actively experiencing a problem and scanning for *their* symptom. Lead with symptoms phrased as the user sees them; write solutions as numbered steps; bold UI/product terms. Keep it short and simple (KISS).

## Skeleton

```
# Troubleshooting {product name, feature, or task}

{1-2 sentences on scope: does this cover the whole product or one task/feature?}

## Symptom 1
{Describe the symptom as the user experiences it — the exact error text or the performance/behavior issue.}

### Cause 1 of symptom 1
{Explain this cause. If there are multiple causes, list one at a time.}

### Solution or workaround to cause 1 of symptom 1
{Numbered steps to resolve it. Describe what a successful result looks like.}

### Cause 2 of symptom 1
{The next cause.}

### Solution or workaround to cause 2 of symptom 1
{Numbered steps. State the result when solved.}

### For more information
{Links to other resources that help solve this issue.}
* [Link](https://example.com/article1.html)
* [Link](https://example.com/article2.html)

## Symptom 2
...
```

## Filling tips

- **Intro / scope:** In 1-2 sentences tell readers whether this guide covers the whole product or a single task/feature, so they know within seconds they're in the right place. Frame it around the problem (e.g. "resolve the slow startup on your Mac").
- **Symptom:** Describe what the user actually observes — quote the exact error message or describe the visible behavior. Phrase symptoms as questions or bullets users can scan, and put this front and center since people arrive searching for *their* symptom. Link each symptom to its causes.
- **Cause:** One cause per heading. If a symptom has several causes, separate them so the user can match their situation rather than wading through irrelevant fixes.
- **Solution / workaround:** Write as numbered steps — users follow along and need to track their place. Bold the **product/UI terms** so they know exactly what to click or run. State what a successful result looks like so users can confirm they're done.
- **For more information:** Link out to docs, KB articles, or related guides that go deeper than the inline fix.
- **General:** Test every solution on all supported platforms before publishing. Prefer text over screenshots — images are hard to maintain and can't be copy-pasted; screenshot only the genuinely visual parts. Revisit as the product evolves so fixes stay accurate.
