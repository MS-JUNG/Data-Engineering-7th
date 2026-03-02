#!/usr/bin/env bash
set -euo pipefail

SPARK_MASTER_URL="${SPARK_MASTER_URL:-spark://spark-master:7077}"
OUTPUT_PATH="${OUTPUT_PATH:-/output/pi}"

mkdir -p "${OUTPUT_PATH}"

/opt/spark/bin/spark-submit \
  --master "${SPARK_MASTER_URL}" \
  --conf "spark.driver.extraJavaOptions=-Dlog4j.configuration=log4j2.properties" \
  /opt/spark/examples/src/main/python/pi.py 1000 \
  | tee "${OUTPUT_PATH}/pi.log"
