# Day 4 Night Shift outputs

The Night Shift extension creates additional advanced Gold outputs and one executive-facing view.

## Advanced Gold tables

Expected Night Shift Gold tables:

- `vattenfall_dev.analytics.gold_data_trust_audit`
- `vattenfall_dev.analytics.gold_asset_incident_intelligence`
- `vattenfall_dev.analytics.gold_weather_grid_risk_correlation`
- `vattenfall_dev.analytics.gold_market_operations_stress`
- `vattenfall_dev.analytics.gold_pipeline_observability_summary`

## Executive view

Expected executive-facing view:

- `vattenfall_dev.analytics.vw_executive_energy_risk_dashboard`

## Output purpose

The Night Shift outputs answer deeper questions than the normal Day 4 Gold layer:

- Which data outputs are trustworthy enough for reporting?
- Which assets show repeated or high-severity incidents?
- Which days show both weather risk and grid incidents?
- Which regions show combined market and operations stress?
- What should executives see as a simplified energy risk dashboard?
- What evidence exists about the Night Shift pipeline run?

## Design principle

Each output should have a clear grain, explainable business logic, validation evidence, and a clear audience.