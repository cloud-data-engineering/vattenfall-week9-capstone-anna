# 02_weather_autoloader

## Purpose

This notebook is reserved for loading weather observation CSV files into the Bronze layer.

## Source domain

`sample_data/weather/`

## Expected Bronze table

`vattenfall_dev.raw.bronze_weather`

## Expected fields

- event_date
- region
- temperature_c
- wind_speed_kmh
- precipitation_mm
- weather_alert_level
- source_system
- last_updated_ts