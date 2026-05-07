-- Night Shift executive dashboard view

CREATE OR REPLACE VIEW vattenfall_dev.analytics.vw_executive_energy_risk_dashboard AS
SELECT *
FROM vattenfall_dev.analytics.gold_executive_energy_risk_dashboard_base;

SELECT *
FROM vattenfall_dev.analytics.vw_executive_energy_risk_dashboard
LIMIT 50;