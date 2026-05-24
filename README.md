# TyphoonAnalysis
John's analysis of Conrad's text with the intention of generating metadata

This repo contains an Observable Notebook – `TyphoonAnalysisNotebook.html` – with the entire Typhoon text chopped up into paragraphs, one cell per manually editable paragraph.

Observable Notebooks are .html files. They can be read conveniently On MacOS computers via the downloadable [Observable Desktop](https://observablehq.com/notebook-kit/desktop) app.

The notebook creates and contains a JavaScript object `typhoon` with paragraph entries keyed by number strings (`"0"`, `"1"`, ...). Each paragraph will, after John's analyis, be given a `.bf` rating based on the [Beaufort Scale](https://en.wikipedia.org/wiki/Beaufort_scale) of 0-12, a `.ttr` for **time to read**, optionally a `.cm` Comment, and possibly other usable bits of metadata.

## Paragraph Key Refactor (drop `p` prefix)

Canonical paragraph keys are now unprefixed number strings:

- new canonical form: `typhoon["123"]`
- legacy form (being phased out): `typhoon["p123"]`

Refactor rules:

1. New paragraph writes must use unprefixed keys.
2. Reads should tolerate both formats during migration.
3. Iteration over paragraph entries should match numeric keys and legacy `p`-prefixed keys, dedupe by number, and prefer unprefixed keys.
4. Chapter keys remain unchanged (`c0`, `c1`, ...).

Migration status:

1. The notebook writer helper now stores paragraphs under unprefixed keys.
2. Analysis/chart utilities now read both key formats for compatibility.
3. Existing persisted uses of `p`-prefixed references should be migrated to unprefixed keys when touched.

John is going through all of the text to give these ratings and will also highlight **key texts** in bold: texts to which ourselves and the model should give particular attention.

John also intends to write a critical commentary on the text to elucidate details of the transformer models ~= typhoon allegory.

John's commentary will be contained in interleaved cells, displaying Markdown, that will also be used to make any metadata assigments that have to made manually.