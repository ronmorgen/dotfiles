# SDK Overview — A high-level orientation to a client library: what it does, who it's for, and where to go next

**Use when:** You're introducing an SDK/client library and want developers to quickly judge whether it fits their project — purpose, supported platforms/languages, key features, and pointers to deeper docs. Sets context for the rest of the SDK docs.
**Don't use when:** You want a first-call walkthrough of raw HTTP endpoints (use api-getting-started), an exhaustive endpoint/parameter spec (use api-reference), or a dated log of changes (use changelog — link to it, don't reproduce it). Overview orients; it does not teach setup or document APIs.
**Audience & voice:** Software developers and architects (mobile, backend, frontend, DevOps) deciding whether to adopt. Technical, concise, scannable. Bullet points and tables over prose. Platform-specific terminology is fine. No setup steps, no API reference.

## Skeleton

```
# SDK overview – {SDK name} {version 0.0.0}

{High-level summary: one or two paragraphs. What the SDK is, the problems it solves, the product/platform it integrates with, and who should use it (mobile/backend/frontend devs). No setup steps or API references.}

## What's in this SDK?
* **SDK purpose:** {What the SDK helps developers do — build apps on your API, embed functionality, handle integrations.}
* **Requirements:** {Supported languages (+min versions), platforms/OS (+min versions), environments, hardware, optional dependencies.}
* **Key use cases:**
  * Build custom integrations with {your product's API}.
  * Process data from {service or sensor}.
  * Embed {specific UI components} into apps.
  * Automate workflows in {target environment}.

## Key features
| Feature | Description |
| :---- | :---- |
| {Feature name} | {What it does and the developer benefit.} |
| {Feature name} | {Use case it enables.} |
| {Feature name} | {Optional: link to full documentation.} |

## Changelog reference
The latest SDK version is **{0.0.0}**. For updates and fixes, see the [changelog]({link}).

## Next steps
{Link the documents that exist in your environment, ordered basic to advanced.}
* {Getting started}{link}
* {Code samples}{link}
* {Advanced tutorials}{link}
* {FAQ / troubleshooting}{link}
* {Support / contact}{link}
* {Community (Discord)}{link}
* {GitHub issues}{link}
```

## Filling tips

- **Title:** Identify the SDK and its scope using a consistent convention: `{Product} SDK`, `{Product} SDK for {platform}`, or add `{version X.Y.Z}` only when it matters for compatibility. Keep it short (e.g. "Payments SDK for Android v2.1.0").
- **High-level summary:** One or two paragraphs answering: what is this SDK, who is it for, what problems does it solve. Use the pattern "{SDK} provides {capability}. It is designed for {audience} and helps {solve problem / enable workflow}." Goal: let a reader decide relevance fast. No setup or API detail.
- **What's in this SDK?:** Answer "can I use this in my environment, and what does it cover?" List supported platforms/OS, languages (with minimum versions), key use cases, and high-level requirements including optional dependencies. Use short bullets or labeled sub-sections for scannability.
- **Key features:** List major capabilities, most important first, in a table (or short paragraphs if only a few). For each: what it does plus the developer benefit, in 1-3 sentences of plain language. This is an overview, not full feature docs — avoid APIs, architecture, and config; link out for detail.
- **Changelog reference:** State the version this overview describes and link the canonical changelog (GitHub releases or version-history page); note if breaking changes are documented there. Keep to 1-3 sentences and do not duplicate the changelog content. Keep version formatting consistent with the title.
- **Next steps:** Make the SDK actionable with links ordered basic to advanced: getting started, code samples/quickstarts, advanced tutorials, FAQ/troubleshooting, GitHub issues, support contact, and community channels. One-line descriptions, consistent formatting, and make support/feedback easy to find.
