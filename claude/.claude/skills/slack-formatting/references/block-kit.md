# Block Kit Reference

Block Kit is Slack's structured layout system. Use it whenever mrkdwn alone can't deliver the layout — actual headers, columns of fields, dividers, images, buttons, or guaranteed list rendering.

A message posted via `chat.postMessage` carries up to **50 blocks** in the `blocks` array. The top-level `text` field is the notification fallback (not rendered when blocks are present, but required for accessibility and push notifications).

## Minimal `chat.postMessage` payload

```json
{
  "channel": "C01234ABCDE",
  "text": "Plain-text fallback for notifications",
  "blocks": [
    {
      "type": "header",
      "text": { "type": "plain_text", "text": "Deploy complete" }
    },
    {
      "type": "section",
      "text": { "type": "mrkdwn", "text": "*v1.4.2* shipped to prod at <!date^1714857600^{time}|11:00>." }
    },
    { "type": "divider" },
    {
      "type": "context",
      "elements": [
        { "type": "mrkdwn", "text": "Owner: <@U01234ABCDE>" }
      ]
    }
  ]
}
```

## Block types (the ones you'll actually use)

### `header`

Big title text. **Plain text only — mrkdwn is ignored.** Max 150 chars.

```json
{ "type": "header", "text": { "type": "plain_text", "text": "Weekly Report" } }
```

### `section`

The workhorse. Holds a single `text` (mrkdwn or plain), optional `fields` (up to 10), optional `accessory` (image or interactive element).

```json
{
  "type": "section",
  "text": { "type": "mrkdwn", "text": "*Status:* :large_green_circle: All systems normal" },
  "fields": [
    { "type": "mrkdwn", "text": "*Latency*\n42ms p99" },
    { "type": "mrkdwn", "text": "*Errors*\n0.01%" }
  ]
}
```

`fields` render as a two-column grid. Use `*Label*\nvalue` per field for a clean look. Each field text is capped at 2,000 chars.

### `divider`

A horizontal rule. No content.

```json
{ "type": "divider" }
```

### `context`

Small, deemphasized line for metadata (timestamps, owners, PR links). Up to 10 elements (mrkdwn text or images).

```json
{
  "type": "context",
  "elements": [
    { "type": "mrkdwn", "text": "Posted by <@U01234ABCDE> · <https://example.com/run/42|run #42>" }
  ]
}
```

### `image`

Image as a block. `image_url` must be HTTPS and publicly fetchable. `alt_text` is required.

```json
{
  "type": "image",
  "image_url": "https://example.com/chart.png",
  "alt_text": "Latency chart for the last 24h"
}
```

### `actions`

Interactive elements (buttons, selects, datepickers). Up to 25 elements; usually 1–5.

```json
{
  "type": "actions",
  "elements": [
    {
      "type": "button",
      "text": { "type": "plain_text", "text": "View run" },
      "url": "https://example.com/run/42"
    }
  ]
}
```

A button with a `url` is a link button (no app handling needed). Buttons without `url` need an `action_id` and a Slack app to receive the interaction.

### `rich_text`

The right way to render **lists, blockquotes, and inline styling reliably** across all surfaces. The block is a tree of typed elements; you don't write mrkdwn here, you write structured JSON.

Bulleted list:

```json
{
  "type": "rich_text",
  "elements": [
    {
      "type": "rich_text_list",
      "style": "bullet",
      "elements": [
        { "type": "rich_text_section", "elements": [ { "type": "text", "text": "First item" } ] },
        { "type": "rich_text_section", "elements": [ { "type": "text", "text": "Second item" } ] }
      ]
    }
  ]
}
```

Numbered list: `"style": "ordered"`. Nested lists: nest a `rich_text_list` inside a `rich_text_section`, increasing the `indent` integer.

Inline styling on a text element uses a `style` object: `{ "type": "text", "text": "bold", "style": { "bold": true } }`. Available flags: `bold`, `italic`, `strike`, `code`.

Use `rich_text` whenever the message contains a real list and must look identical on desktop, mobile, and notifications.

## When to choose what

| Need                                           | Use                                  |
| ---------------------------------------------- | ------------------------------------ |
| One-line status                                | mrkdwn `text` only, no blocks        |
| Title + paragraphs                             | `header` + `section`s                |
| Side-by-side key/value pairs                   | `section` with `fields`              |
| Reliable bullet or numbered list               | `rich_text` with `rich_text_list`    |
| Footer metadata (timestamp, author, link)      | `context`                            |
| Buttons or links as CTAs                       | `actions` with link buttons          |
| Visual separator between sections              | `divider`                            |

## Common mistakes

- **Using `mrkdwn` in a `header` block.** `header.text.type` must be `plain_text`. Mrkdwn syntax shows up literally.
- **Forgetting `text` fallback.** When `blocks` is present, `text` is still required for notifications and accessibility. Make it a meaningful summary, not "[no text]".
- **Mixing `rich_text` and mrkdwn for the same content.** Pick one. `rich_text` is structured JSON; `section.text` with `type: mrkdwn` is the string-based path. Don't try to embed mrkdwn syntax inside `rich_text` text elements — it won't be parsed.
- **Over-blocking.** A three-line update doesn't need 6 blocks. One `section` with a mrkdwn string is fine.
- **Putting more than 10 `fields` in one section.** Slack rejects the message. Split into multiple sections.

## Post-message edits

`chat.update` takes the same `blocks` and `text`. Block IDs (`block_id` on each block) are auto-assigned if omitted; set them explicitly when you intend to update individual blocks later.
