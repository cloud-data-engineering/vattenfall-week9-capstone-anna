# Day 1 deliverables

By the end of Day 1, the repository should contain a clear engineering foundation for the capstone project.

## Required deliverables

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

## Completion criteria

Day 1 is complete when the repository clearly explains:

- what the project is
- why the project exists
- what source domains are used
- how the repository is structured
- which Unity Catalog objects are targeted
- which Bronze tables are expected
- how Bronze outputs will be validated

## Engineering standard

The repository should look like the beginning of a real data engineering project, not only a collection of notebook files.

## Day 1 execution evidence

Day 1 created the governed Unity Catalog foundation, prepared landing and checkpoint directories, copied source CSV files into landing volumes, and loaded the expected Bronze tables.

Validated Bronze tables:

- `vattenfall_dev.raw.bronze_market_prices`
- `vattenfall_dev.raw.bronze_weather`
- `vattenfall_dev.raw.bronze_grid_events`
- `vattenfall_dev.raw.bronze_asset_reference`

The Bronze layer is ready to support Day 2 Silver cleaning and standardization.