# Architecture overview

The project follows a governed medallion lakehouse architecture in Databricks.

```text
Landing files
↓
Bronze Delta tables
↓
Silver cleaned tables
↓
Business logic layer
↓
Gold reporting tables/views
↓
Dashboard-ready outputs
```

## Landing layer

The landing layer stores raw source files grouped by business domain.

## Bronze layer

The Bronze layer stores raw or lightly processed Delta tables.

Expected Day 1 Bronze tables:

```text
vattenfall_dev.raw.bronze_market_prices
vattenfall_dev.raw.bronze_weather
vattenfall_dev.raw.bronze_grid_events
vattenfall_dev.raw.bronze_asset_reference
```

## Silver layer

The Silver layer will clean, type, standardize, and validate the Bronze data.

## Business logic layer

The business logic layer will combine domains and create energy operations indicators.

## Gold layer

The Gold layer will provide dashboard-ready outputs for reporting and final delivery.

## Governance

Unity Catalog will organize the project into governed catalogs, schemas, volumes, and tables.