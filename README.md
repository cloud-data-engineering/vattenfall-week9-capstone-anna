# Vattenfall Week 9 Capstone — Energy Operations and Market Intelligence Lakehouse

## Theme

This project is a Vattenfall-inspired Databricks capstone focused on energy operations and market intelligence.

The goal is to build a governed, multi-source lakehouse that moves data from raw files into Bronze, Silver, Gold, and final reporting outputs.

## Business domains

The project combines four source domains:

- market prices
- weather observations
- grid events
- reference data

These domains represent a realistic energy operations use case: market prices affect business decisions, weather conditions can influence operations, and grid events reveal operational risk and performance.

## Week goal

By the end of the week, this repository should contain a structured Databricks lakehouse project with:

- raw files organized by domain
- Bronze Delta tables for raw ingestion
- Silver tables for cleaned and standardized data
- business logic for energy operations indicators
- Gold outputs for reporting and dashboards
- Unity Catalog governance structure
- validation and quality checks

## Day 1 focus

Day 1 focuses on the engineering foundation and Bronze ingestion planning.

The Day 1 work includes:

- repository structure
- documentation layer
- split configuration files
- domain-based sample data layout
- Unity Catalog target design
- SQL setup scaffolding
- Bronze notebook scaffolding
- GitHub workflow structure check

## Target Unity Catalog design

The intended governed target structure is:

```text
catalog: vattenfall_dev

schemas:
  raw
  refined
  analytics

volumes:
  raw.landing
  raw.checkpoints
```

The `raw` schema supports Bronze ingestion, the `refined` schema supports Silver cleaned tables, and the `analytics` schema supports Gold reporting outputs.

## Main folders

```text
config/              Project configuration files
docs/                Project documentation and design notes
sample_data/         Raw sample files organized by business domain
sql/                 Unity Catalog setup and validation SQL
src/                 Reusable Python package scaffolding
notebooks/           Databricks notebook scaffolding
tests/               Repository and pipeline validation checks
.github/workflows/   GitHub Actions workflow checks
```

## Day 1 expected Bronze tables

```text
vattenfall_dev.raw.bronze_market_prices
vattenfall_dev.raw.bronze_weather
vattenfall_dev.raw.bronze_grid_events
vattenfall_dev.raw.bronze_asset_reference
```

## Project explanation

I am building a Databricks lakehouse that ingests energy market, weather, grid event, and reference data, then turns it into governed, business-ready outputs for energy operations and market intelligence.