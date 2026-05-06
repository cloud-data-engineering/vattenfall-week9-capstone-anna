from pyspark.sql import DataFrame


def build_regional_operations_base(
    grid_df: DataFrame,
    asset_df: DataFrame,
    weather_df: DataFrame
) -> DataFrame:
    return (
        grid_df.alias("g")
        .join(asset_df.alias("a"), on="asset_id", how="left")
        .join(
            weather_df.alias("w"),
            (grid_df["region"] == weather_df["region"])
            & (grid_df["event_day"] == weather_df["report_day"]),
            how="left"
        )
    )