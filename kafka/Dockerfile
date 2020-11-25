FROM openjdk:latest

LABEL maintainer="grammy.jiang@gmail.com"

ARG KAFKA_VERSION
ARG SCALA_VERSION

ENV KAFKA_FILE=kafka_${SCALA_VERSION}-${KAFKA_VERSION}
ENV KAFKA_LINK=https://downloads.apache.org/kafka/${KAFKA_VERSION}/${KAFKA_FILE}.tgz

RUN microdnf install wget \
 && wget \
    --continue \
    --output-document - \
    --quiet \
    ${KAFKA_LINK} \
  | tar --extract --gzip \
 && mv ${KAFKA_FILE} kafka \
 && microdnf remove wget \
 && microdnf clean all

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh / \
 && chmod +x /usr/local/bin/docker-entrypoint.sh  # backwards compat

EXPOSE 9092
ENTRYPOINT ["docker-entrypoint.sh"]
