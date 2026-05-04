# 01_market_prices_autoloader

## Purpose

This notebook is reserved for loading market price CSV files into the Bronze layer.

## Source domain

`sample_data/market_prices/`

## Expected Bronze table

`vattenfall_dev.raw.bronze_market_prices`

## Expected fields

- event_date
- region
- market_type
- price_eur_mwh
- volume_mwh
- source_system
- last_updated_ts