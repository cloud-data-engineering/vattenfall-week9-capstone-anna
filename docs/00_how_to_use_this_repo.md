# How to use this repo

This repository is the working repository for the Vattenfall Week 9 Capstone project.

The project should be built step by step, following the lakehouse layers:

```text
raw files
↓
Bronze ingestion
↓
Silver cleaning
↓
business logic
↓
Gold reporting outputs
↓
validation and delivery
```

## Day 1 navigation

For Day 1, the recommended order is:

1. Read the README and documentation.
2. Review the configuration files.
3. Inspect the sample data layout.
4. Run the Unity Catalog setup SQL.
5. Prepare landing and checkpoint paths.
6. Run Bronze ingestion notebooks.
7. Validate Bronze tables.
8. Commit and push the completed milestone.

## Project principle

The goal is not only to make notebooks run, but to build a repository that is understandable, maintainable, and explainable.