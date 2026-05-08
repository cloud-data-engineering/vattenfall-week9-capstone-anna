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