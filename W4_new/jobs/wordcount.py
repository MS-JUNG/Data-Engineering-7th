from pyspark.sql import SparkSession


def main():
    spark = SparkSession.builder.appName("wordcount").getOrCreate()

    input_path = spark.conf.get("spark.wordcount.input", "/data/input.txt")
    output_path = spark.conf.get("spark.wordcount.output", "/output/wordcount")

    lines = spark.read.text(input_path)
    words = lines.selectExpr("explode(split(value, '\\\\s+')) as word").where("word != ''")
    counts = words.groupBy("word").count().orderBy("word")

    counts.write.mode("overwrite").csv(output_path, header=True)
    spark.stop()


if __name__ == "__main__":
    main()

