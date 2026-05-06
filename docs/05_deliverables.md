# Capstone deliverables

This document tracks the daily deliverables completed during the Vattenfall Week 9 Capstone project.

## Day 1 - Repository foundation

By the end of Day 1, the repository should contain a clear engineering foundation for the capstone project.

### Required deliverables

The expected Day 1 deliverables are:

- project README
- documentation layer
- configuration files
- sample data layout
- SQL setup scripts
- notebook scaffolding
- Unity Catalog target design
- Bronze validation SQL
- GitHub workflow check
- committed and pushed project work

### Completion criteria

Day 1 is complete when the repository clearly explains:

- what the project is
- why the project exists
- what source domains are used
- how the repository is structured
- which Unity Catalog objects are targeted
- which Bronze tables are expected
- how Bronze outputs will be validated

### Engineering standard

The repository should look like the beginning of a real data engineering project, not only a collection of notebook files.

### Day 1 execution evidence

Day 1 created the governed Unity Catalog foundation, prepared landing and checkpoint directories, copied source CSV files into landing volumes, and loaded the initial expected Bronze tables.

Validated Bronze tables:

- `vattenfall_dev.raw.bronze_market_prices`
- `vattenfall_dev.raw.bronze_weather`
- `vattenfall_dev.raw.bronze_grid_events`
- `vattenfall_dev.raw.bronze_asset_reference`

The Day 1 foundation prepared the project for the Day 2 Bronze ingestion implementation.

## Day 2 - Bronze implementation

By the end of Day 2, the repository and Databricks workspace should contain a working multi-source Bronze ingestion layer.

### Required deliverables

The expected Day 2 deliverables are:

- confirmed Unity Catalog setup
- populated landing folders by source domain
- checkpoint paths by source domain
- schema tracking paths for Auto Loader
- Auto Loader notebooks for the main raw source domains
- Bronze Delta tables with ingestion metadata
- reference data Bronze load
- Bronze validation notebook
- updated documentation
- committed and pushed project work

### Source domains

The Day 2 Bronze layer ingests the following source domains:

- market prices
- weather observations
- grid events
- reference data

### Auto Loader implementation

For the main raw source domains, the Bronze ingestion notebooks use Auto Loader with governed Unity Catalog landing paths.

Implemented Auto Loader notebooks:

- `notebooks/02_bronze/01_market_prices_autoloader`
- `notebooks/02_bronze/02_weather_autoloader`
- `notebooks/02_bronze/03_grid_events_autoloader`

Each Auto Loader notebook defines:

- source domain
- landing path
- checkpoint path
- schema tracking path
- Bronze target table
- ingestion metadata
- validation output

### Reference data load

Reference data is loaded into the Bronze layer using a simpler Bronze Delta load pattern, as reference files are smaller and less stream-oriented than the main event-style source domains.

Reference Bronze notebook:

- `notebooks/02_bronze/04_reference_data_load`

Target table:

- `vattenfall_dev.raw.bronze_asset_reference`

### Bronze metadata

The Bronze tables include ingestion metadata for traceability:

- `ingestion_ts`: timestamp showing when the row was loaded into Bronze
- `source_file`: source file path used to trace each row back to the raw file

### Bronze validation

The Bronze validation notebook checks:

- table existence
- row counts
- schema visibility
- ingestion metadata presence
- source file traceability
- sample rows for inspection

Validation notebook:

- `notebooks/02_bronze/05_bronze_validation`

Validated Bronze tables:

- `vattenfall_dev.raw.bronze_market_prices`
- `vattenfall_dev.raw.bronze_weather`
- `vattenfall_dev.raw.bronze_grid_events`
- `vattenfall_dev.raw.bronze_asset_reference`

### Completion criteria

Day 2 is complete when:

- all expected Bronze tables exist
- all Bronze tables contain rows
- ingestion metadata is present
- source file traceability is available
- schemas can be inspected
- validation passes without errors
- the implementation is committed and pushed

### Engineering standard

The Bronze layer should preserve raw source boundaries, keep ingestion traceability, and avoid Silver or Gold business logic.

### Day 2 result

The Day 2 Bronze layer is working, validated, documented, committed, and ready to support Day 3 Silver cleaning and standardization.

## Day 3 - Silver layer engineering

By the end of Day 3, the project should contain cleaned, standardized, validated, and reusable Silver datasets built from the Day 2 Bronze layer.

### Required deliverables

The expected Day 3 deliverables are:

- Silver notebooks completed
- reusable transformation code in `src/transforms/`
- reusable validation helpers in `src/validation/`
- at least one meaningful UDF in `src/udfs/`
- `sys.path.append(...)` used to import project modules
- `df.transform()` used in the Silver transformation flow
- Silver Delta tables created
- integrated Silver base table created
- Silver validation outputs
- updated SQL validation scripts
- committed and pushed project work

### Source Bronze tables

The Day 3 Silver layer uses the following Bronze tables as inputs:

- `vattenfall_dev.raw.bronze_market_prices`
- `vattenfall_dev.raw.bronze_weather`
- `vattenfall_dev.raw.bronze_grid_events`
- `vattenfall_dev.raw.bronze_asset_reference`

### Silver outputs

The Day 3 implementation created the following Silver tables:

- `vattenfall_dev.refined.silver_market_prices`
- `vattenfall_dev.refined.silver_weather`
- `vattenfall_dev.refined.silver_grid_events`
- `vattenfall_dev.refined.silver_asset_reference`
- `vattenfall_dev.refined.silver_regional_operations_base`

### Transformation modules

Reusable transformation logic was added under `src/transforms/`:

- `market_price_transforms.py`
- `weather_transforms.py`
- `grid_event_transforms.py`
- `integration_transforms.py`

These modules keep the notebooks cleaner and make the transformation logic easier to reuse, test, and explain.

### UDF usage

A meaningful UDF was added in:

- `src/udfs/grid_udfs.py`

The UDF creates a `severity_band` field for grid events, grouping operational severity values into reusable categories such as `ELEVATED`, `WATCH`, and `NORMAL`.

### Silver transformation logic

The Silver notebooks use `df.transform()` to apply reusable transformations in a clear pipeline style.

Example transformation flow:

```text
read Bronze
↓
standardize columns
↓
cast fields
↓
add derived day fields
↓
filter invalid records
↓
write Silver Delta table
↓
validate output
```

### Domain-specific Silver work

Market prices Silver:

- standardized `region`
- standardized `market_type`
- cast `price_eur_mwh`
- cast `volume_mwh`
- created `report_day`
- filtered invalid price and volume records

Weather Silver:

- standardized `region`
- standardized `weather_alert_level`
- cast `temperature_c`
- cast `wind_speed_kmh`
- cast `precipitation_mm`
- created `report_day`
- filtered invalid weather records

Grid events Silver:

- standardized `region`
- standardized `event_type`
- standardized `severity`
- cast `duration_minutes`
- created `event_timestamp` from the actual Bronze `event_date` field
- created `event_day`
- added `severity_band` using a UDF
- filtered invalid event records

Asset reference Silver:

- standardized `asset_id`
- standardized `region`
- standardized `asset_type`
- removed duplicate asset records
- prepared a clean reference table for later joins

### Integrated Silver base

The integrated Silver output combines:

- cleaned grid events
- cleaned asset reference data
- cleaned weather context

Target table:

- `vattenfall_dev.refined.silver_regional_operations_base`

This table prepares the project for Day 4 business logic and Gold outputs.

### Silver validation

The Silver validation notebook checks:

- table existence
- row counts
- schema visibility
- key null values
- invalid values
- domain values
- sample rows for inspection

Validation notebook:

- `notebooks/03_silver/06_silver_validation`

SQL validation files:

- `sql/04_day3_silver_validation.sql`
- `sql/05_day3_integrated_silver_inspection.sql`
- `sql/06_day3_null_and_invalid_checks.sql`

### Completion criteria

Day 3 is complete when:

- all required Silver tables exist
- all Silver tables contain rows
- reusable `src/` modules are used
- `df.transform()` is used meaningfully
- at least one UDF is used meaningfully
- validation checks pass
- SQL validation scripts are available
- the integrated Silver base is ready for Day 4

### Engineering standard

The Silver layer should not be a simple copy of Bronze. It should add clear engineering value by cleaning, standardizing, validating, and preparing reusable datasets for business logic and Gold outputs.

### Day 3 result

The Day 3 Silver layer is working, validated, documented, committed, and ready to support Day 4 testing, logging, business logic, and Gold reporting outputs.

## Day 4 — Gold, governance, testing, and dashboard delivery

By the end of Day 4, the project should turn the cleaned Silver layer into tested, governed, business-facing Gold outputs and dashboard-ready reporting structures.

### Required deliverables

The expected Day 4 deliverables are:

- Silver validation before Gold creation
- logging and run summary notebooks
- reusable Gold helper modules
- business logic notebooks
- Gold Delta tables
- Gold validation checks
- analyst-facing Gold views
- dashboard documentation
- governance notes and Catalog Explorer inspection
- SQL validation and governance scripts
- committed and pushed project work

### Silver foundation validation

Before creating Gold outputs, the Silver layer was validated for:

- table existence
- row counts
- key null values
- invalid values
- join readiness

Validation notebook:

- `notebooks/04_testing_logging/01_silver_testing_and_validation`

### Logging and observability

Day 4 added reusable logging helpers in:

- `src/utils/logging_utils.py`

The logging pattern prints:

- source tables
- target tables
- row counts
- business logic summaries
- governance placement

Logging notebook:

- `notebooks/04_testing_logging/02_logging_and_run_summaries`

### Business logic

Day 4 prepared business indicators for market, weather, and grid operations.

Business logic notebooks:

- `notebooks/05_business_logic/01_business_logic_market_weather`
- `notebooks/05_business_logic/02_business_logic_grid_operations`

Reusable helper modules:

- `src/metrics/business_metrics.py`
- `src/transforms/gold_aggregations.py`
- `src/validation/gold_checks.py`

Business indicators include:

- high market price flag
- weather risk signal
- grid incident severity summaries
- operational status
- operational attention flag

### Gold outputs

The Day 4 implementation created the following Gold tables in the analytics schema:

- `vattenfall_dev.analytics.gold_daily_market_summary`
- `vattenfall_dev.analytics.gold_weather_impact_summary`
- `vattenfall_dev.analytics.gold_grid_incident_summary`
- `vattenfall_dev.analytics.gold_regional_operations_dashboard`

### Gold table purpose

Daily market summary:

- grain: one row per report day and region
- purpose: daily regional market price and volume overview

Weather impact summary:

- grain: one row per report day and region
- purpose: daily regional weather condition and alert context

Grid incident summary:

- grain: one row per event day, region, and severity band
- purpose: operational incident burden and severity reporting

Regional operations dashboard:

- grain: one row per report day and region
- purpose: dashboard-ready combined market, weather, and grid operations view

### Gold views

Day 4 created analyst-facing views in the analytics schema:

- `vattenfall_dev.analytics.vw_regional_operations_dashboard`
- `vattenfall_dev.analytics.vw_daily_incident_trends`
- `vattenfall_dev.analytics.vw_market_weather_overview`

Views notebook:

- `notebooks/07_governance/01_gold_views_and_catalog_inspection`

### Dashboard documentation

Dashboard documentation was added under:

- `dashboards/dashboard_requirements.md`
- `dashboards/dashboard_storyboard.md`

Output and presentation documentation was added under:

- `outputs/expected_gold_outputs.md`
- `outputs/presentation_talking_points.md`

### Gold validation

Gold validation checks include:

- row counts
- duplicate grain checks
- key null checks
- KPI sanity checks
- sample output inspection

Validation notebook:

- `notebooks/06_gold/05_gold_validation`

SQL validation files:

- `sql/07_day4_gold_validation.sql`
- `sql/08_day4_gold_views.sql`
- `sql/09_day4_governance_inspection.sql`

### Governance model

The project uses Unity Catalog as the governed delivery frame:

- `raw`: Bronze ingestion and source-preserving tables
- `refined`: cleaned and reusable Silver tables
- `analytics`: business-facing Gold tables and reporting views

Governance notebook:

- `notebooks/07_governance/02_governance_notes_and_permissions_limitations`

In Databricks Free Edition, some permission commands may be limited. The project therefore demonstrates governance through catalog, schema, table, view, and volume organization, plus Catalog Explorer inspection.

### Completion criteria

Day 4 is complete when:

- Silver validation passes before Gold creation
- Gold tables exist and contain rows
- Gold tables have clear business grain
- Gold views are created
- dashboard-ready output is available
- Gold validation checks are visible
- Unity Catalog organization is documented
- governance limitations are explained
- SQL validation scripts are available
- the implementation is committed and pushed

### Engineering standard

The Gold layer should not expose raw technical noise. It should provide curated, business-facing, dashboard-ready outputs with clear grain, useful KPIs, validation evidence, and governance awareness.

### Day 4 result

The Day 4 delivery layer is working, validated, documented, committed, and ready for Day 5 optimization, debugging, and final presentation preparation.