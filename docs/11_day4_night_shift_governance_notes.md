# Day 4 Night Shift governance notes

The Night Shift outputs extend the governed analytics layer of the capstone.

## Unity Catalog organization

The project uses the following structure:

- `vattenfall_dev.raw`: Bronze ingestion and source-preserving data
- `vattenfall_dev.refined`: cleaned and reusable Silver data
- `vattenfall_dev.analytics`: Gold tables, reporting views, and Night Shift advanced delivery outputs

## Night Shift placement

The Night Shift outputs are stored in:

- `vattenfall_dev.analytics`

This is appropriate because the outputs are business-facing, validated, and designed for reporting or executive interpretation.

## Audience

The Night Shift outputs support different audiences:

- data engineers: trust audit and observability summary
- analysts: asset incident intelligence, weather-grid risk, market-operations stress
- executives: executive energy risk dashboard view

## Permission model

In a production environment, permissions would normally be managed through Unity Catalog grants.

Possible access model:

- data engineers: manage and maintain tables
- analysts: read Gold tables and analyst-facing outputs
- executives: read executive dashboard view
- broader users: no direct access unless needed

## Free Edition limitation

In Databricks Free Edition, some permission commands such as `GRANT` or `SHOW GRANTS` may be limited.

For this capstone, governance is demonstrated through catalog, schema, table, view, and documentation structure, plus Catalog Explorer inspection.