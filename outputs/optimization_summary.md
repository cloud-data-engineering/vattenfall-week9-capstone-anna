# Optimization summary

Day 5 reviews the completed capstone for performance and maintainability risks.

## Performance and maintainability issues identified

### 1. Repeated actions

Issue: several notebooks use repeated `.count()` calls on the same DataFrame.

Risk: each `.count()` can trigger a Spark job.

Improvement: store counts in variables and reuse them for logging and validation.

### 2. Wide joins

Issue: some joins originally carried duplicate or unnecessary technical columns.

Risk: wide DataFrames are harder to debug and may increase processing overhead.

Improvement: select business-relevant columns before joining.

### 3. Ambiguous columns after joins

Issue: joined DataFrames can contain repeated column names such as `incident_count`, `region`, or technical metadata fields.

Risk: ambiguous references can cause runtime errors or unclear schemas.

Improvement: rename or select columns explicitly before joining.

### 4. Display overload

Issue: notebooks use multiple `display()` calls during development.

Risk: useful for learning, but too much output makes notebooks harder to review.

Improvement: keep representative displays and rely on row-count logs and validation summaries.

### 5. Late validation

Issue: if validation happens only at the end, errors are harder to trace.

Risk: broken assumptions may be hidden inside later aggregations.

Improvement: validate row counts, null keys, duplicate grains, and output schemas immediately after important writes.

## Explain plan inspections

The Day 5 performance review uses `explain(True)` on:

- a Silver grid review DataFrame
- a Gold grid aggregation
- a dashboard-style Gold join

## Targeted improvement principle

The project does not optimize blindly. It first identifies risks, then applies targeted improvements that make the pipeline cleaner, easier to debug, and easier to explain.

## Optimization improvements applied

### OPT-001 - Reduce repeated actions

Original pattern: repeated `.count()` calls on the same DataFrame.

Improved pattern: store count results in variables and reuse them.

Why it helps: avoids repeated Spark jobs for the same DataFrame.

Applied to: validation and inventory notebooks.

### OPT-002 - Prune columns before joins

Original pattern: joining wide DataFrames with unnecessary or duplicate columns.

Improved pattern: select only business-relevant columns before joining.

Why it helps: reduces schema width, avoids ambiguous columns, and makes joins easier to debug.

Applied to: integrated Silver logic, Gold dashboard logic, and executive risk dashboard logic.

### OPT-003 - Use stable sources for persistent views

Original pattern: creating a persistent Unity Catalog view from a temporary view.

Improved pattern: write a managed Delta base table first, then create the view from that table.

Why it helps: the view remains reusable and is not tied to the notebook session.

Applied to: `vw_executive_energy_risk_dashboard`.

### OPT-004 - Validate immediately after writes

Original pattern: output tables are written and validated only later.

Improved pattern: validate row counts, key nulls, duplicate grains, and sample outputs immediately after important writes.

Why it helps: errors are easier to locate and explain.

Applied to: Silver, Gold, and Night Shift outputs.

### OPT-005 - Add explicit logging

Original pattern: notebooks rely on implicit outputs.

Improved pattern: print source table, target table, grain, row count, and business logic summaries.

Why it helps: notebook runs are easier to inspect, debug, and present.