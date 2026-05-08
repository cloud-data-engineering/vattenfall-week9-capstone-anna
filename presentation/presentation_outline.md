# Capstone presentation outline

## 1. Business context

- Vattenfall-inspired energy operations and market intelligence use case
- Source domains: market prices, weather, grid events, asset reference data
- Goal: turn raw operational data into trusted, governed, business-facing outputs

## 2. Architecture overview

- Raw files
- Unity Catalog landing volumes
- Bronze tables in `raw`
- Silver tables in `refined`
- Gold tables and views in `analytics`
- Night Shift executive risk extension

## 3. Day 1 - Foundation

- Repository structure
- Documentation and configuration
- Unity Catalog target design
- SQL and notebook scaffolding

## 4. Day 2 - Bronze

- Auto Loader ingestion
- Landing/checkpoint/schema tracking paths
- Metadata columns: `ingestion_ts`, `source_file`
- Bronze validation

## 5. Day 3 - Silver

- Cleaning and standardization
- Reusable `src/` modules
- `df.transform()`
- UDF for `severity_band`
- Integrated Silver base

## 6. Day 4 - Gold

- Business-facing Gold summaries
- Dashboard-ready regional operations table
- Analyst-facing views
- Validation, logging, and governance notes

## 7. Night Shift extension

- Trust audit
- Asset incident intelligence
- Weather-grid risk correlation
- Market-operations stress
- Observability summary
- Executive risk dashboard view

## 8. Day 5 - Optimization and debugging

- Pipeline inventory
- Performance review
- `explain(True)` inspections
- Debugging scenarios
- Targeted improvements
- Final validation

## 9. Final outputs

- `gold_regional_operations_dashboard`
- `vw_regional_operations_dashboard`
- `vw_executive_energy_risk_dashboard`
- `gold_data_trust_audit`
- `gold_pipeline_observability_summary`

## 10. Final conclusion

The project delivers a governed, validated, explainable lakehouse that moves from raw data to business-facing and executive-ready outputs.