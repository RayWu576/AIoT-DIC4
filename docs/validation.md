# Submission validation

| Artifact | Checks | Result |
| --- | --- | --- |
| V1 initial PDF | Separate IEEEtran/BibTeX build, extracted text and rendered page review | 4 pages |
| V2 revised PDF | Separate IEEEtran/BibTeX build, extracted text and rendered page review | 5 pages |
| Both conference papers | Three figures and four tables, six resolved citations, English text, proposal values and page bounds | Passed |
| Both Overleaf ZIPs | Archive integrity, 12 matching source files, main.tex at root and clean independent rebuild | Passed. The rebuilt page counts and extracted text match the submission PDFs. |
| Difference PDF | Compiled with latexdiff and visually inspected | 6 pages |
| OpenSpec 2.2.0 | Strict validation before work on each change and after revisions | Both changes passed |
| V1 preservation | Git comparison of V1 LaTeX tree, PDF and ZIP against the V1 tag | Identical |
| Overleaf | MCP capability discovery | No Overleaf MCP tool was available. Both independent import packages were delivered. |
| GitHub | Account and repository lookup through MCP. Private repository creation and Git synchronization through the authenticated GitHub account. | Repository linked in publication record. |

Both IEEEtran builds have nonfatal underfull-line warnings in related work. Rendered pages were inspected for clipping, overlap and legibility. The approximate six-page target was applied without adjusting IEEE margins. Both papers use a group attribution because official English author names and affiliations were unavailable.

The difference PDF marks prose and table changes. It uses the revised figures and bibliography, and equations are shown without inline change markup. The revision report records those changes separately.

## SHA-256 of preserved drafts

- V1 `c3e168aea2ebb97c9a57a56c53ab23798adddb13541b85a57099580a948e15f3`
- V2 `643a076d375c442bc85823a70e81301c985bd6d5a1833ea38ea145d93a39bbd9`

## Evidence status

The manuscript reports the two host batches and the board summary separately. Individual scenario traces, model settings, directional waiting data and cycle-aligned board observations were unavailable, so the study results remain proposal-reported. See [research gaps](../research/research-gaps.md).
