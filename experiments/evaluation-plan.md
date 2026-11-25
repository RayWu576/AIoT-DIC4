# Reproduction plan

Freeze the arrivals, initial queues, time step, horizon, plan catalog and phase-dependent service model for both policies. Save paired run manifests and per-step directional arrival, queue, departure, phase and applied-plan records. Include balanced, imbalanced, reversal, burst and oversaturated demand. Report per-run and per-axis queue vehicle-seconds, completed-vehicle mean wait with its denominator, residual queues and elapsed wait for unfinished vehicles. Preserve negative cases. A rule-only comparator on the same runs can isolate tree approximation from adaptive selection.

On the board, submit a valid plan during a cycle and capture state immediately before and after the next boundary. Record recommendation, accepted request, phase, countdown and applied plan. Check invalid or expired requests, review-only behavior and readback mismatch as separate cases. Keep hardware results distinct from synthetic queue outcomes.
