# 03_landing_and_checkpoint_setup

## Purpose

This notebook is reserved for preparing landing and checkpoint paths for Day 1 Bronze ingestion.

## Landing paths

Landing paths store incoming raw files grouped by source domain.

Expected source domains:

- market_prices
- weather
- grid_events
- reference

## Checkpoint paths

Checkpoint paths store ingestion state so incremental loading can track what has already been processed.