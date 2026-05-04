# 03_grid_events_autoloader

## Purpose

This notebook is reserved for loading grid event CSV files into the Bronze layer.

## Source domain

`sample_data/grid_events/`

## Expected Bronze table

`vattenfall_dev.raw.bronze_grid_events`

## Expected fields

- event_id
- event_date
- region
- asset_id
- event_type
- severity
- duration_minutes
- source_system
- last_updated_ts