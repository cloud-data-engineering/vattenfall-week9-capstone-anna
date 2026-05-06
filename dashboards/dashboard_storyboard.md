# Dashboard storyboard

## Dashboard title

Vattenfall Energy Operations and Market Intelligence Dashboard

## Dashboard story

The dashboard should provide a regional daily view of market pressure, weather context, and grid incident activity.

It should help a business user understand where operational attention may be needed and which regions show a combination of price, weather, and incident signals.

## Suggested sections

### 1. Regional operations overview

Shows the combined day-region dashboard output from:

- `gold_regional_operations_dashboard`

### 2. Market context

Shows daily market price and volume trends from:

- `gold_daily_market_summary`

### 3. Weather impact context

Shows wind, temperature, precipitation, and alert context from:

- `gold_weather_impact_summary`

### 4. Grid incident summary

Shows event counts, severity bands, and total duration from:

- `gold_grid_incident_summary`

## Important limitation

The dashboard can show operational context and correlation-style signals, but it should not claim that weather caused grid events or market conditions unless further causal analysis is performed.