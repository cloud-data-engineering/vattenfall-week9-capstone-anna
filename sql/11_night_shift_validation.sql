-- Night Shift row count validation

SELECT COUNT(*) AS row_count
FROM vattenfall_dev.analytics.gold_data_trust_audit;

SELECT COUNT(*) AS row_count
FROM vattenfall_dev.analytics.gold_asset_incident_intelligence;

SELECT COUNT(*) AS row_count
FROM vattenfall_dev.analytics.gold_weather_grid_risk_correlation;

SELECT COUNT(*) AS row_count
FROM vattenfall_dev.analytics.gold_market_operations_stress;

SELECT COUNT(*) AS row_count
FROM vattenfall_dev.analytics.gold_pipeline_observability_summary;

SELECT COUNT(*) AS row_count
FROM vattenfall_dev.analytics.vw_executive_energy_risk_dashboard;

-- Duplicate grain checks

SELECT asset_id, COUNT(*) AS duplicate_count
FROM vattenfall_dev.analytics.gold_asset_incident_intelligence
GROUP BY asset_id
HAVING COUNT(*) > 1;

SELECT report_day, region, COUNT(*) AS duplicate_count
FROM vattenfall_dev.analytics.gold_weather_grid_risk_correlation
GROUP BY report_day, region
HAVING COUNT(*) > 1;

SELECT report_day, region, COUNT(*) AS duplicate_count
FROM vattenfall_dev.analytics.gold_market_operations_stress
GROUP BY report_day, region
HAVING COUNT(*) > 1;

SELECT report_day, region, COUNT(*) AS duplicate_count
FROM vattenfall_dev.analytics.vw_executive_energy_risk_dashboard
GROUP BY report_day, region
HAVING COUNT(*) > 1;