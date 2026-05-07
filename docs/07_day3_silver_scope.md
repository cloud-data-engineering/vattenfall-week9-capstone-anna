# Day 3 Silver scope

Day 3 transforms the Bronze layer into cleaned, standardized, validated, and reusable Silver datasets.

## Purpose

The goal of Day 3 is to make raw Bronze data usable for business logic, reporting, and later Gold outputs.

## Silver outputs

Day 3 creates the following Silver tables:

- `vattenfall_dev.refined.silver_market_prices`
- `vattenfall_dev.refined.silver_weather`
- `vattenfall_dev.refined.silver_grid_events`
- `vattenfall_dev.refined.silver_asset_reference`
- `vattenfall_dev.refined.silver_regional_operations_base`

## Transformation approach

The Silver layer uses reusable project code under `src/`, including:

- `src/transforms/market_price_transforms.py`
- `src/transforms/weather_transforms.py`
- `src/transforms/grid_event_transforms.py`
- `src/transforms/integration_transforms.py`
- `src/udfs/grid_udfs.py`
- `src/validation/silver_checks.py`

## Engineering patterns

Day 3 uses:

- `sys.path.append(...)`
- reusable transform modules
- `df.transform()`
- a meaningful UDF
- validation helpers
- SQL validation scripts

## Main cleaning work

The Silver layer standardizes:

- regions
- market types
- weather alert levels
- grid event types
- severity values
- dates and timestamps
- numeric fields

It also filters invalid records and prepares stable join keys.

## Integrated Silver base

The table `silver_regional_operations_base` combines cleaned grid events, asset reference data, and weather context.

This integrated Silver table prepares the project for Day 4 business logic and Gold delivery.

## Validation

Silver validation checks include:

- row counts
- schemas
- key null checks
- invalid value checks
- domain value inspection
- sample row inspection

## Engineering note

Silver is not a copy of Bronze. It adds engineering value by making the data clean, standardized, reusable, and trustworthy.