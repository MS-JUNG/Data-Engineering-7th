FROM eclipse-temurin:11-jre-jammy

ARG SPARK_VERSION=3.5.1
ARG HADOOP_VERSION=3

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl python3 python3-pip procps \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL "https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" \
    | tar -xz -C /opt \
    && ln -s "/opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}" /opt/spark

ENV SPARK_HOME=/opt/spark
ENV PATH="${SPARK_HOME}/bin:${SPARK_HOME}/sbin:${PATH}"
ENV PYSPARK_PYTHON=python3

WORKDIR /opt/spark
