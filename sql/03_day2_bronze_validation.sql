SELECT COUNT(*) AS row_count
FROM vattenfall_dev.raw.bronze_market_prices;

SELECT COUNT(*) AS missing_metadata_rows
FROM vattenfall_dev.raw.bronze_market_prices
WHERE ingestion_ts IS NULL OR source_file IS NULL;

SELECT COUNT(*) AS row_count
FROM vattenfall_dev.raw.bronze_weather;

SELECT COUNT(*) AS missing_metadata_rows
FROM vattenfall_dev.raw.bronze_weather
WHERE ingestion_ts IS NULL OR source_file IS NULL;

SELECT COUNT(*) AS row_count
FROM vattenfall_dev.raw.bronze_grid_events;

SELECT COUNT(*) AS missing_metadata_rows
FROM vattenfall_dev.raw.bronze_grid_events
WHERE ingestion_ts IS NULL OR source_file IS NULL;

SELECT COUNT(*) AS row_count
FROM vattenfall_dev.raw.bronze_asset_reference;

SELECT COUNT(*) AS missing_metadata_rows
FROM vattenfall_dev.raw.bronze_asset_reference
WHERE ingestion_ts IS NULL OR source_file IS NULL;