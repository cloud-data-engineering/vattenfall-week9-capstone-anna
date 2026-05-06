from pyspark.sql import DataFrame
from pyspark.sql import functions as F


def count_nulls(df: DataFrame, column_name: str) -> int:
    return df.filter(F.col(column_name).isNull()).count()


def print_basic_quality_summary(df: DataFrame, table_name: str) -> None:
    print("Table:", table_name)
    print("Row count:", df.count())
    print("Column count:", len(df.columns))
    print("Columns:", df.columns)