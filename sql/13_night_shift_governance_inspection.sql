-- Night Shift governance inspection

SHOW TABLES IN vattenfall_dev.analytics;

DESCRIBE TABLE vattenfall_dev.analytics.gold_data_trust_audit;

DESCRIBE TABLE vattenfall_dev.analytics.gold_asset_incident_intelligence;

DESCRIBE TABLE vattenfall_dev.analytics.gold_weather_grid_risk_correlation;

DESCRIBE TABLE vattenfall_dev.analytics.gold_market_operations_stress;

DESCRIBE TABLE vattenfall_dev.analytics.gold_pipeline_observability_summary;

DESCRIBE TABLE vattenfall_dev.analytics.gold_executive_energy_risk_dashboard_base;

DESCRIBE TABLE vattenfall_dev.analytics.vw_executive_energy_risk_dashboard;

-- Permission commands may be limited in Databricks Free Edition.
-- Governance is documented through catalog, schema, table, view, and audience structure.