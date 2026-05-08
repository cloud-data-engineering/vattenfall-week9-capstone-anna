# Day 5 optimization decisions

Day 5 optimization decisions are targeted improvements based on project review.

## Optimization principles

The project should avoid:

- repeated `.count()` actions
- unnecessary repeated reads
- carrying unused columns through joins
- joining before selecting needed columns
- displaying large DataFrames repeatedly
- missing validation after writes

## Required improvements

At least three improvements should be documented with:

- original pattern
- improved pattern
- reason for improvement
- expected benefit
- tradeoff
- where it is applied

## Principle

The goal is not perfect performance. The goal is visible, explainable engineering improvement.