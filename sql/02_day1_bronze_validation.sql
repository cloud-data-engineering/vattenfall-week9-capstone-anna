SELECT 'bronze_market_prices' AS table_name, COUNT(*) AS row_count
FROM vattenfall_dev.raw.bronze_market_prices;

SELECT 'bronze_weather' AS table_name, COUNT(*) AS row_count
FROM vattenfall_dev.raw.bronze_weather;

SELECT 'bronze_grid_events' AS table_name, COUNT(*) AS row_count
FROM vattenfall_dev.raw.bronze_grid_events;

SELECT 'bronze_asset_reference' AS table_name, COUNT(*) AS row_count
FROM vattenfall_dev.raw.bronze_asset_reference;