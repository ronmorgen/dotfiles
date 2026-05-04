#!/usr/bin/env python3
"""
Validate Slack mrkdwn text for leaked standard-Markdown syntax.

Usage:
    validate_mrkdwn.py <file>     # read from a file
    validate_mrkdwn.py -          # read from stdin

Exits 0 when the text is clean, 1 when issues are found. Prints each issue as
`<line>:<col> <rule> — <suggestion>` to stdout.

Rules detected:
  - **bold**          → use *bold*
  - ~~strike~~        → use ~strike~
  - [text](url)       → use <url|text>
  - # ATX header      → mrkdwn has no headers; bold the line or use a Block Kit header
  - | pipe | tables   → not supported; use a code block or Block Kit fields
  - <@alice>          → user mentions need a Slack ID (<@U01234ABCDE>)
  - <@USER_ID>        → unfilled placeholder (warning, still exits 1)

Uppercase-with-underscore placeholders like `<@USER_ID>`, `<#CHANNEL_ID>` are
recognized as deliberate placeholders rather than malformed mentions, but still
flagged so the caller knows to fill them in before posting.

Code spans (`...`) and fenced code blocks (```...```) are skipped — anything
inside them is allowed to contain literal Markdown syntax.
"""

from __future__ import annotations

import re
import sys
from dataclasses import dataclass


@dataclass
class Issue:
    line: int
    col: int
    rule: str
    suggestion: str

    def format(self) -> str:
        return f"{self.line}:{self.col} {self.rule} — {self.suggestion}"


# Rules that scan a single non-code line.
LINE_RULES: list[tuple[str, re.Pattern[str], str]] = [
    (
        "bold-double-asterisk",
        re.compile(r"\*\*[^*\n]+\*\*"),
        "Slack uses single asterisks: *bold*, not **bold**",
    ),
    (
        "strike-double-tilde",
        re.compile(r"~~[^~\n]+~~"),
        "Slack uses single tildes: ~strike~, not ~~strike~~",
    ),
    (
        "markdown-link",
        re.compile(r"\[[^\]\n]+\]\([^)\n]+\)"),
        "Slack link syntax is <url|text>, not [text](url)",
    ),
    (
        "atx-header",
        re.compile(r"^\s{0,3}#{1,6}\s+\S"),
        "mrkdwn has no headers; bold the line (*Title*) or use a Block Kit header block",
    ),
    (
        "pipe-table",
        re.compile(r"^\s*\|.+\|\s*$"),
        "mrkdwn does not render tables; use a code block or Block Kit section.fields",
    ),
    (
        "unfilled-placeholder",
        re.compile(r"<[@#](?:[A-Z][A-Z0-9_]{2,}_(?:ID|NAME))>"),
        "Unfilled placeholder — replace before posting",
    ),
    (
        "non-numeric-mention",
        re.compile(r"<@(?![UW][A-Z0-9]{6,})(?![A-Z][A-Z0-9_]{2,}_(?:ID|NAME)>)[^>]+>"),
        "User mentions need a Slack ID like <@U01234ABCDE>, not a username",
    ),
    (
        "non-numeric-channel",
        re.compile(r"<#(?!C[A-Z0-9]{6,})(?![A-Z][A-Z0-9_]{2,}_(?:ID|NAME)[>|])[^>]+>"),
        "Channel links need a Slack ID like <#C01234ABCDE>, not a name alone",
    ),
]


def strip_inline_code(line: str) -> str:
    """Replace backtick-delimited spans with spaces so rules don't fire inside code."""
    out = []
    i = 0
    while i < len(line):
        if line[i] == "`":
            # find matching backtick
            end = line.find("`", i + 1)
            if end == -1:
                out.append(line[i:])
                break
            out.append(" " * (end - i + 1))
            i = end + 1
        else:
            out.append(line[i])
            i += 1
    return "".join(out)


def validate(text: str) -> list[Issue]:
    issues: list[Issue] = []
    in_fence = False
    for lineno, raw in enumerate(text.splitlines(), start=1):
        stripped = raw.lstrip()
        if stripped.startswith("```"):
            in_fence = not in_fence
            continue
        if in_fence:
            continue

        scan = strip_inline_code(raw)
        for rule, pattern, suggestion in LINE_RULES:
            for match in pattern.finditer(scan):
                issues.append(
                    Issue(
                        line=lineno,
                        col=match.start() + 1,
                        rule=rule,
                        suggestion=suggestion,
                    )
                )
    return issues


def main() -> int:
    if len(sys.argv) != 2:
        print(__doc__, file=sys.stderr)
        return 2

    source = sys.argv[1]
    if source == "-":
        text = sys.stdin.read()
    else:
        with open(source, encoding="utf-8") as fh:
            text = fh.read()

    issues = validate(text)
    for issue in issues:
        print(issue.format())
    return 1 if issues else 0


if __name__ == "__main__":
    sys.exit(main())
