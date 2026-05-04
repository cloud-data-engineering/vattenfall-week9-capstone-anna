# 02_uc_setup

## Purpose

This notebook is reserved for Unity Catalog setup.

It should create or confirm the governed target structure:

- catalog: `vattenfall_dev`
- schema: `raw`
- schema: `refined`
- schema: `analytics`
- volume: `landing`
- volume: `checkpoints`

## SQL reference

The matching SQL setup script is stored in:

`sql/01_uc_setup.sql`