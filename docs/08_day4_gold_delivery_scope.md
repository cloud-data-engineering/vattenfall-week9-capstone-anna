# Day 4 Gold delivery scope

Day 4 creates the business-facing delivery layer of the capstone.

## Purpose

The goal of Day 4 is to turn validated Silver data into tested, governed, dashboard-ready Gold outputs.

## Gold outputs

Day 4 creates these Gold tables:

- `vattenfall_dev.analytics.gold_daily_market_summary`
- `vattenfall_dev.analytics.gold_weather_impact_summary`
- `vattenfall_dev.analytics.gold_grid_incident_summary`
- `vattenfall_dev.analytics.gold_regional_operations_dashboard`

## Gold views

Day 4 creates analyst-facing and dashboard-facing views:

- `vattenfall_dev.analytics.vw_regional_operations_dashboard`
- `vattenfall_dev.analytics.vw_daily_incident_trends`
- `vattenfall_dev.analytics.vw_market_weather_overview`

## Business logic

The Gold layer includes business indicators such as:

- high market price flag
- weather risk signal
- grid incident counts
- elevated incident counts
- operational status
- operational attention flag

## Logging and observability

Day 4 adds reusable logging helpers to make notebook runs easier to inspect.

The notebooks print:

- source tables
- target tables
- row counts
- business logic summaries
- governance placement

## Dashboard readiness

The main dashboard-ready output is:

- `gold_regional_operations_dashboard`

It combines market, weather, and grid incident signals at a day-region grain.

## Governance

Day 4 uses Unity Catalog to organize outputs by layer:

- `raw`: Bronze ingestion tables
- `refined`: Silver cleaned and reusable tables
- `analytics`: Gold business-facing tables and views

## Validation

Gold validation checks include:

- row counts
- duplicate grain checks
- key null checks
- KPI sanity checks
- sample output inspection

## Engineering note

Gold does not expose raw technical noise. It provides curated, understandable, business-facing outputs with clear grain, useful KPIs, validation evidence, and governance awareness.