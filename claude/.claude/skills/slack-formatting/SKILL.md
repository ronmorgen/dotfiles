---
name: slack-formatting
description: Formatting reference for Slack messages (mrkdwn syntax, mentions, escaping, Block Kit). Triggers when drafting a Slack message, posting via the Slack API or webhooks, formatting an announcement or notification for Slack, or converting standard Markdown to Slack-compatible output. Differs from `draft-announcement`, which handles the drafting workflow — this skill is the formatting reference it relies on.
---

# Slack Formatting

Slack uses **mrkdwn**, a Markdown variant with several specific divergences from CommonMark. The mistakes below are the ones models make most often. When the message will be posted via the Slack API, also consult `references/block-kit.md` for richer layouts.

## Corrections (write the right side)

| Standard Markdown              | Slack mrkdwn                                                      |
| ------------------------------ | ----------------------------------------------------------------- | --- | -------- | -------------------------------- |
| `**bold**`                     | `*bold*`                                                          |
| `*italic*` (CommonMark italic) | `_italic_` — single asterisks render as bold in Slack, not italic |
| `_italic_`                     | `_italic_` (same)                                                 |
| `~~strike~~`                   | `~strike~`                                                        |
| `` `code` ``                   | `` `code` `` (same)                                               |
| ` ```lang\ncode\n``` `         | ` ```\ncode\n``` ` (no language hint)                             |
| `> quote`                      | `> quote` (same; one `>` per line)                                |
| `[text](https://example.com)`  | `<https://example.com\|text>`                                     |
| `https://example.com`          | `<https://example.com>` (auto-linked too)                         |
| `# Header`, `## Header`        | No headers in mrkdwn — see workarounds                            |
| `- item`, `* item`             | Use `•` literal — see "Lists" below                               |
| `                              | col                                                               | col | ` tables | Not supported — use a code block |

`**double asterisks**` renders as a literal `*word*` with stray asterisks. `*single asterisks*` is bold, not italic. These two are the most frequent slips.

## Mentions and special tokens

These are pure-recall items. Always use the angle-bracket form — plain `@alice` does not notify.

| Target                 | Token                                                                 |
| ---------------------- | --------------------------------------------------------------------- |
| User                   | `<@U01234ABCDE>`                                                      |
| Channel link           | `<#C01234ABCDE>` or `<#C01234ABCDE\|name>`                            |
| User group             | `<!subteam^S01234ABCDE>` (add `\|@name` for fallback)                 |
| Active channel members | `<!here>`                                                             |
| All channel members    | `<!channel>`                                                          |
| Whole workspace        | `<!everyone>`                                                         |
| Date                   | `<!date^1777852800^{date_short}\|May 4, 2026>` (epoch is UTC seconds) |
| Emoji                  | `:thumbsup:` (custom emojis use the workspace name)                   |

Don't invent IDs. If the caller didn't provide one, leave an uppercase-with-underscore placeholder — `<@USER_ID>`, `<@ALICE_ID>`, `<#CHANNEL_ID>` — and tell the caller they must fill it in before posting. The validator recognizes this convention and emits an `unfilled-placeholder` warning rather than a malformed-mention error.

## Escaping

Only three characters are escaped in mrkdwn text fields:

- `&` → `&amp;`
- `<` → `&lt;`
- `>` → `&gt;`

Don't escape `*`, `_`, `~`, `` ` ``, `|`, `(`, or `)`. To show a literal asterisk, wrap it in a code span: `` `*` ``.

## Things mrkdwn does not support

| Want               | Workaround                                                                     |
| ------------------ | ------------------------------------------------------------------------------ |
| Headers            | `*Bold line*` on its own line, or a Block Kit `header` block                   |
| Tables             | Code block with space-padded columns, or Block Kit `fields`                    |
| Task lists         | `:white_check_mark: done`, `:black_square_button: todo`                        |
| Footnotes          | Inline `(note: …)` or a separate quoted block at the bottom                    |
| Nested bold/italic | `*bold _bolditalic_ bold*` works; `_italic *bolditalic* italic_` is unreliable |

## Lists

mrkdwn list rendering **varies across surfaces** (desktop, mobile, notifications, thread previews). For guaranteed output:

- Use a literal bullet: `• item` (U+2022). For nested: indent with two spaces and use `◦` or `▪`.
- Or, when posting via API, use a Block Kit `rich_text` block with `rich_text_list` elements — that gives native bullet/numbered rendering with proper indentation.

Do not assume `-` or `*` will render as a bullet. They sometimes do, sometimes don't.

## Length limits (when posting via API)

- Message `text` (top-level fallback): 40,000 chars, but truncated in clients past ~4,000.
- Block Kit `section.text`: 3,000 chars per text object.
- Block Kit `header.text`: 150 chars (plain_text only — no mrkdwn).
- Up to 50 blocks per message.
- Up to 10 fields per `section.fields`; each field text capped at 2,000 chars.

For long content, split across multiple `section` blocks separated by `divider` blocks rather than one giant text field.

## Verifying output

Before declaring a Slack message done, run the validator on the final mrkdwn text to catch leaked standard-Markdown:

```bash
python3 scripts/validate_mrkdwn.py - <<'EOF'
{message text here}
EOF
```

It flags `**bold**`, `~~strike~~`, `[text](url)`, ATX headers (`# `, `## `, …), and pipe-table rows. Exit code is non-zero when issues are found.

## Block Kit

For anything richer than mrkdwn — actual headers, fields, dividers, images, buttons, context lines, or guaranteed list rendering — see `references/block-kit.md`. It covers the common block types, the `rich_text` block, and the JSON shape for `chat.postMessage`.
