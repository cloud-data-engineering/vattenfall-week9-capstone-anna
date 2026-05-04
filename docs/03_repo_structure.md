# Repository structure

This repository is organized to separate documentation, configuration, SQL setup, notebooks, sample data, reusable code, and tests.

## Main folders

| Folder | Purpose |
|---|---|
| `config/` | Stores YAML configuration files for project settings, paths, and table names. |
| `docs/` | Stores project documentation and design decisions. |
| `sample_data/` | Stores raw sample data organized by business domain. |
| `sql/` | Stores SQL scripts for Unity Catalog setup and validation. |
| `src/` | Stores reusable Python modules for later pipeline logic. |
| `notebooks/` | Stores Databricks notebooks for setup, ingestion, transformations, and validation. |
| `tests/` | Stores validation and test scaffolding. |
| `.github/workflows/` | Stores GitHub Actions workflows. |

## Design principle

The repository is structured so that each part of the project has a clear responsibility. This makes the project easier to understand, maintain, and explain.