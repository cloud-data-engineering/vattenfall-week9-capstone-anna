# Presentation talking points

## Project story

This capstone builds a governed Databricks lakehouse for a Vattenfall-inspired energy operations and market intelligence use case.

## Day 1

Designed the project foundation, repository structure, documentation, configuration, Unity Catalog target structure, and raw data layout.

## Day 2

Implemented Bronze ingestion using Auto Loader, governed landing paths, checkpoints, schema tracking, and ingestion metadata.

## Day 3

Transformed Bronze data into cleaned, standardized, validated, and reusable Silver tables using `src` modules, `df.transform()`, and a meaningful UDF.

## Day 4

Created tested, governed, business-facing Gold outputs and dashboard-ready views based on the Silver layer.

## Engineering decisions to explain

- why Bronze preserves raw arrivals
- why Silver cleans and standardizes data
- why Gold aggregates by business grain
- why Auto Loader uses checkpoints and schema tracking
- why metadata columns support traceability
- why the integrated Silver base prepares Day 4 business logic
- why dashboard outputs should avoid raw technical noise