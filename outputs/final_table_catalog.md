# Final table catalog

This catalog summarizes the final Vattenfall capstone data products across Bronze, Silver, Gold, Night Shift, and reporting views.

## Bronze tables

- `vattenfall_dev.raw.bronze_market_prices`
- `vattenfall_dev.raw.bronze_weather`
- `vattenfall_dev.raw.bronze_grid_events`
- `vattenfall_dev.raw.bronze_asset_reference`

## Silver tables

- `vattenfall_dev.refined.silver_market_prices`
- `vattenfall_dev.refined.silver_weather`
- `vattenfall_dev.refined.silver_grid_events`
- `vattenfall_dev.refined.silver_asset_reference`
- `vattenfall_dev.refined.silver_regional_operations_base`

## Gold tables

- `vattenfall_dev.analytics.gold_daily_market_summary`
- `vattenfall_dev.analytics.gold_weather_impact_summary`
- `vattenfall_dev.analytics.gold_grid_incident_summary`
- `vattenfall_dev.analytics.gold_regional_operations_dashboard`

## Night Shift advanced outputs

- `vattenfall_dev.analytics.gold_data_trust_audit`
- `vattenfall_dev.analytics.gold_asset_incident_intelligence`
- `vattenfall_dev.analytics.gold_weather_grid_risk_correlation`
- `vattenfall_dev.analytics.gold_market_operations_stress`
- `vattenfall_dev.analytics.gold_pipeline_observability_summary`
- `vattenfall_dev.analytics.gold_executive_energy_risk_dashboard_base`

## Views

- `vattenfall_dev.analytics.vw_regional_operations_dashboard`
- `vattenfall_dev.analytics.vw_daily_incident_trends`
- `vattenfall_dev.analytics.vw_market_weather_overview`
- `vattenfall_dev.analytics.vw_executive_energy_risk_dashboard`

## Presentation-ready outputs

The main outputs for presentation are:

- `gold_regional_operations_dashboard`
- `vw_regional_operations_dashboard`
- `vw_executive_energy_risk_dashboard`
- `gold_data_trust_audit`
- `gold_pipeline_observability_summary`

## Readiness note

The final pipeline inventory confirms that the project has a complete lakehouse structure from Bronze ingestion to Silver cleaning, Gold delivery, Night Shift risk intelligence, and dashboard-ready views.