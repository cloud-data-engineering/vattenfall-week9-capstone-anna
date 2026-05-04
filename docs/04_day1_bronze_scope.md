# Day 1 Bronze scope

Day 1 focuses on the engineering foundation and Bronze ingestion planning.

## Day 1 goals

The Day 1 goals are:

- create a professional repository structure
- document the project and business context
- define split configuration files
- organize raw sample data by domain
- define Unity Catalog target objects
- create SQL setup and validation scripts
- prepare notebook scaffolding for setup and Bronze ingestion
- validate expected Bronze outputs

## Source domains

The Day 1 source domains are:

- market prices
- weather observations
- grid events
- asset reference data

## Expected Bronze outputs

The expected Bronze tables are:

- `vattenfall_dev.raw.bronze_market_prices`
- `vattenfall_dev.raw.bronze_weather`
- `vattenfall_dev.raw.bronze_grid_events`
- `vattenfall_dev.raw.bronze_asset_reference`

## Validation approach

Bronze validation should confirm that each expected Bronze table exists and contains rows.

The asset reference table is included in the Day 1 validation because it is part of the Bronze foundation and will support later joins with grid event data.