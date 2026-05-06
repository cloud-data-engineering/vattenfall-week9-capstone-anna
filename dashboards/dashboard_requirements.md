# Dashboard requirements

## Purpose

The Day 4 dashboard-ready outputs should help analysts and business users understand regional energy operations, market conditions, weather context, and grid incident pressure.

## Main dashboard questions

The dashboard should help answer:

- Which regions show elevated operational incidents?
- Which days show high market price pressure?
- How do weather conditions relate to grid events?
- Which regions need operational attention?
- What summary tables can feed business-facing reporting?

## Dashboard-ready Gold output

Primary dashboard table:

```text
vattenfall_dev.analytics.gold_regional_operations_dashboard
```

Primary dashboard view:

```text
vattenfall_dev.analytics.vw_regional_operations_dashboard
```

## Required dimensions

The dashboard output should include stable dimensions such as:

- report day
- region
- severity context
- weather alert context

## Required KPIs

The dashboard output should include useful business KPIs such as:

- average market price
- total market volume
- average wind speed
- weather alert indicator
- grid event count
- elevated event count
- total incident duration
- operational attention flag

## Design principle

The dashboard output should avoid raw technical noise and provide a clear business-facing grain: one row per day and region.