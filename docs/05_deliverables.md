# Capstone deliverables

This document tracks the daily deliverables completed during the Vattenfall Week 9 Capstone project.

## Day 1 — Repository foundation

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

## Day 2 — Bronze implementation

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