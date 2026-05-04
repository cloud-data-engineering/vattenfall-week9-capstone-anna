# 04_reference_data_load

## Purpose

This notebook is reserved for loading reference data into the Bronze layer.

## Source domain

`sample_data/reference/`

## Expected Bronze table

`vattenfall_dev.raw.bronze_asset_reference`

## Expected fields

- asset_id
- asset_name
- region
- asset_type

## Note

Reference data will support later joins with grid event records.