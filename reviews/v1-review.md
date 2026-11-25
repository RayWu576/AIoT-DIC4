# Independent review of V1

**Recommendation: Major revision.** The draft provides a coherent architecture and reports the trade-off in the preliminary comparisons. The paper needs a more explicit separation of design, observed outcomes and proposed verification. The review covers the preserved four-page V1 PDF and its source.

## R01. I. Introduction and Abstract

- **Severity** Major
- **Original content** "The study asks whether demand-aware selection improves queue and waiting measures relative to fixed timing"
- **Identified weakness** The three goals imply similar evidence maturity, although only queue summaries and a qualitative application result are available.
- **Suggested revision** Pair each research question with its evidence and state the integration contribution as a testable chain.
- **Supporting evidence** Proposal pp. 2, 6, 8; no decision or board traces.
- **Acceptance criteria** Distinguish measured queue summaries from pending path auditing and boundary verification.

## R02. II. Related Work and references

- **Severity** Minor
- **Original content** "The engineering gap addressed here is how to link a small selector's reasoning to the behavior of a board-level phase controller."
- **Identified weakness** The gap is stated without showing how each evidence type differs; the printed Wu reference presents 2013 as pagination and omits a stable DOI link.
- **Suggested revision** Contrast policy inspection, traffic evaluation and board readback; identify the article number and add the DOI URL.
- **Supporting evidence** NeurIPS, both arXiv records, Nature Communications record and FHWA metadata in the citation map.
- **Acceptance criteria** Keep six sources; distinguish publication types and identify article 2013 with DOI.

## R03. III-B to III-D

- **Severity** Major
- **Original content** "The reference rule evaluates candidate timing plans to generate training labels."
- **Identified weakness** No explicit queue accounting or boundary between training label, in-domain inference and runtime fallback.
- **Suggested revision** Give symbolic conservation, arrival-window and label-selection notation with explicit unknowns; define selector and fallback cases.
- **Supporting evidence** Proposal pp. 6-7 specifies four features and reference scoring but supplies no parameters or tree export.
- **Acceptance criteria** Define units, sampling convention, candidate set and each path without inventing scores or thresholds.

## R04. III-E to III-F and IV-D

- **Severity** Major
- **Original content** "The FPGA side sequences phases and manages the countdown, applying accepted requests at cycle boundaries."
- **Identified weakness** An accepted request and an applied plan can appear equivalent, and a stale readback may be mistaken for a mismatch.
- **Suggested revision** Distinguish candidate, pending and active states; position readback after the expected boundary and specify verification outcomes.
- **Supporting evidence** Proposal pp. 6-8; no phase-aligned logs or protocol implementation.
- **Acceptance criteria** Show old plan remains active until handoff, qualifying unknown behavior and proposed test outcomes.

## R05. IV-A to IV-B

- **Severity** Major
- **Original content** "Average waiting time summarizes time spent queued by vehicles in the chosen analysis population."
- **Identified weakness** Undefined denominator and censored waiting prevent meaningful comparisons; paired conditions and aggregation need a sharper protocol.
- **Suggested revision** Define completed-vehicle waiting with accompanying residual and accrued-wait measures, directional queue burden and a proposed pooled estimator.
- **Supporting evidence** Proposal p. 8 warns to interpret waiting with unfinished vehicles; raw traces and aggregation script unavailable.
- **Acceptance criteria** Define zero denominators and censoring; label proposed formulas as a reproduction protocol.

## R06. IV-C to IV-E

- **Severity** Major
- **Original content** "Negative scenarios show that aggregate improvement can coexist with regressions."
- **Identified weakness** Counts lack an interpretable denominator in the discussion, and competing causes are not connected to diagnostic traces.
- **Suggested revision** Report scenario shares per batch, give counterexample diagnostics, and explain why paired rule-only evaluation and directional checks matter.
- **Supporting evidence** Proposal p. 8 reports 5/18 and 2/6, mentions balanced and burst cases, and gives no per-run data.
- **Acceptance criteria** Keep batches separate; distinguish arithmetic from observations and diagnosis hypotheses from findings.

## R07. IV-D to IV-E and V

- **Severity** Major
- **Original content** "Independent reproduction requires the underlying runs and controller traces."
- **Identified weakness** The minimum artifact set differs for model training, replay and board verification and is not enumerated in the paper.
- **Suggested revision** Add a reproducibility checklist with field-level dependencies and explicit claim limits.
- **Supporting evidence** Proposal pp. 6-8 and workspace evidence inventory.
- **Acceptance criteria** Identify required traffic inputs, model settings, controller versions and timestamps. Retain the limits on road inference.

## R08. Figs. 1-3 and Table I

- **Severity** Minor
- **Original content** "Decision and execution sequence for valid submissions."
- **Identified weakness** Workflow branches are unlabeled, board arrows are generic, and narrow justified source cells introduce uneven spacing.
- **Suggested revision** Label branch conditions and statuses directly, enrich board figure and use ragged-right source cells.
- **Supporting evidence** Rendered V1 pp. 1-3 and LaTeX layout diagnostics.
- **Acceptance criteria** Preserve three figures and four tables, with readable branch and handoff labels and no clipped text.

## R09. Abstract, IV-C and conclusion

- **Severity** Minor
- **Original content** "The results describe a course prototype and motivate further validation of the integrated workflow."
- **Identified weakness** Generic closing language gives the reader little guidance on the limits of the evidence.
- **Suggested revision** Use concrete endpoint-specific wording and a consistent term for queue vehicle-seconds.
- **Supporting evidence** V1 abstract, results table and conclusion.
- **Acceptance criteria** Maintain cautious academic English and use consistent metric naming across all three locations.
