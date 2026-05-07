# Day 2 Bronze implementation

Day 2 turns the Day 1 project foundation into a real Bronze ingestion layer.

## Purpose

The goal of Day 2 is to ingest raw source domains into governed Bronze Delta tables using Databricks Auto Loader where appropriate.

## Source domains

The Bronze layer ingests the following domains:

- market prices
- weather
- grid events
- asset reference data

## Bronze outputs

Day 2 creates or confirms these Bronze tables:

- `vattenfall_dev.raw.bronze_market_prices`
- `vattenfall_dev.raw.bronze_weather`
- `vattenfall_dev.raw.bronze_grid_events`
- `vattenfall_dev.raw.bronze_asset_reference`

## Ingestion pattern

The main ingestion pattern uses:

- governed landing paths
- checkpoint paths
- schema tracking paths
- Auto Loader
- Delta tables
- ingestion metadata

## Metadata

Bronze records include metadata fields such as:

- `ingestion_ts`
- `source_file`
- `_rescued_data` where available

These fields support traceability and help validate where records come from.

## Validation

Day 2 validation checks include:

- row counts
- schema inspection
- metadata presence
- source file distribution
- table existence

## Engineering note

Bronze stays intentionally close to the raw source data. It preserves source records while adding enough metadata to support traceability and downstream processing.