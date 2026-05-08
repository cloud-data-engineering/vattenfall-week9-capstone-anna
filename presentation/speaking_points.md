# Speaking points

## Opening

This project is a Vattenfall-inspired lakehouse for energy operations and market intelligence.

The goal is to move from raw market, weather, grid, and asset data into trusted business outputs that can support dashboards and executive reporting.

## Architecture

The architecture follows a layered lakehouse pattern.

Bronze preserves raw arrivals, Silver cleans and standardizes data, Gold creates business-facing outputs, and the Night Shift extension adds trust and risk intelligence.

## Bronze

The Bronze layer uses Auto Loader with landing paths, checkpoints, schema tracking, and ingestion metadata.

This gives traceability through `ingestion_ts` and `source_file`.

## Silver

The Silver layer transforms Bronze into clean reusable datasets.

I used reusable modules in `src/`, `df.transform()`, and a UDF to classify grid event severity bands.

## Gold

The Gold layer answers business questions at clear reporting grains.

It includes market summaries, weather impact summaries, grid incident summaries, and a regional operations dashboard table.

## Night Shift

The Night Shift extension goes beyond the normal Gold layer.

It adds trust audit evidence, asset-level incident intelligence, weather-grid risk correlation, market-operations stress, observability, and an executive risk dashboard view.

## Governance

Unity Catalog organizes the project into:

- `raw` for Bronze
- `refined` for Silver
- `analytics` for Gold, views, and executive outputs

Some permission commands may be limited in Free Edition, so governance is demonstrated through structure, Catalog Explorer inspection, and documentation.

## Debugging

Important debugging work included path issues, schema mismatch, Python module caching, duplicate join columns, and persistent view creation.

These were handled by inspecting paths, schemas, columns, module state, and stable table/view dependencies.

## Optimization

The Day 5 optimization work focuses on targeted improvements.

I reviewed repeated actions, column pruning, ambiguous joins, validation timing, and logging.

## Closing

The final result is a project that works, but also has validation, observability, governance, debugging notes, optimization reasoning, and presentation-ready outputs.