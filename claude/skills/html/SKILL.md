---
name: html
description: Create a single self-contained HTML artifact instead of a long markdown reply
---

Create one self contained HTML page that explains, compares, demonstrates, or lets the reader
manipulate the subject more effectively than a wall of markdown would. Reach for this whenever
spatial layout, hierarchy, side-by-side comparison, a diagram, lightweight interaction, or a
copy/export button would materially help. Common shapes: an explainer or walkthrough, an approach
comparison with tradeoffs, a code review aid, a plan with milestones and risks, a design or
component sheet, a clickable prototype, an inline SVG diagram, a slide deck, a report or postmortem,
or a small editor that exports markdown/JSON/config. Don't use it when the answer is short, purely
factual, or the reader asked for markdown.

Keep everything inline (CSS and JS), no CDNs, fonts, build steps, or network access; it must open
straight from disk. Keep the JavaScript small and purposeful, use semantic HTML, and make it work on
narrow screens. Include print styles for reports, plans, and decks. Give it a clear title, a one
line statement of what it helps with, and instructions for any controls. If state is editable,
include a copy or export button that returns something useful. Use distinctive design for reader
facing artifacts and stay functional for internal engineering ones; design should serve
comprehension, not decorate it.

Save the artifact to the scratchpad and open it in Safari on completion. Use subagents where it
makes you more efficient, and keep the reader updated on progress. If it makes sense to update and
reuse an existing artifact, do so.

Use light theme when working during the day, and dark theme when working at night. Feel free to make
it subtly solarpunk themed if you like, get creative.

Critically must start the page with <meta charset="utf-8"> before any other markup. The file is
opened over `file://` with no server charset header, so without this Safari falls back to a legacy
encoding and any non-ASCII characters.
