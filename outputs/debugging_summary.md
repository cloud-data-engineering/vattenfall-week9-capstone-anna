# Debugging summary

Day 5 documents debugging scenarios as reusable engineering knowledge.

## Scenario 1 - Path issue

Symptom: file copy or ingestion fails because a path does not exist.

Likely cause: wrong workspace path, wrong tutorial repo path, or wrong Unity Catalog volume path.

Investigation: print the exact source and target paths and inspect them with `dbutils.fs.ls()`.

Fix: correct the path and make sure files move through the expected flow: tutorial repo or sample data → capstone repo → Unity Catalog landing volume.

Prevention: print landing, checkpoint, schema tracking, and source paths before ingestion.

## Scenario 2 - Schema mismatch

Symptom: Silver transformation fails because a column does not exist.

Likely cause: the tutorial expected a column name that differed from the actual Bronze schema.

Investigation: inspect `bronze_grid_df.columns` and sample rows.

Fix: update the reusable transform module to use the real `event_date` column.

Prevention: inspect actual schemas before copying tutorial transformation logic.

## Scenario 3 - Python module cache

Symptom: the notebook still uses an old transform after the `.py` file is updated.

Likely cause: Databricks keeps imported Python modules in memory during the notebook session.

Investigation: confirm the file is saved correctly and reload the module.

Fix: use `importlib.reload(...)`.

Prevention: reload modules or restart compute after editing project files under `src/`.

## Scenario 4 - Join ambiguity

Symptom: joins fail or output schemas become ambiguous because multiple inputs contain the same column names.

Likely cause: joined DataFrames carry duplicate fields such as `region`, `incident_count`, `ingestion_ts`, or `source_file`.

Investigation: inspect columns before and after joins.

Fix: select only business-relevant columns before joining and rename overlapping metrics.

Prevention: apply column pruning before joins and use explicit aliases.

## Scenario 5 - Unity Catalog persistent view issue

Symptom: creating a persistent Unity Catalog view fails when it references a temporary view.

Likely cause: persistent views cannot depend on notebook-session temporary objects.

Investigation: check whether the view definition references a temp view.

Fix: write the dataframe to a managed Delta table first, then create the persistent view from that table.

Prevention: use stable tables as sources for persistent Unity Catalog views.

## Debugging principle

The project follows a structured debugging approach: classify the problem, inspect evidence, apply a targeted fix, and document prevention.