#!/usr/bin/env bash
set -euo pipefail

SPARK_MASTER_URL="${SPARK_MASTER_URL:-spark://spark-master:7077}"
INPUT_PATH="${INPUT_PATH:-/data/input.txt}"
OUTPUT_PATH="${OUTPUT_PATH:-/output/wordcount}"

/opt/spark/bin/spark-submit \
  --master "${SPARK_MASTER_URL}" \
  --conf "spark.wordcount.input=${INPUT_PATH}" \
  --conf "spark.wordcount.output=${OUTPUT_PATH}" \
  /jobs/wordcount.py

