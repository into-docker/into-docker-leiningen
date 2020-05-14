FROM clojure:openjdk-11-lein-2.9.1

ARG COMMIT
ARG BUILD_DATE
ARG USER="builder"

LABEL maintainer="Yannick Scherer <yannick.scherer@gmail.com>"
LABEL org.opencontainers.image.authors="Yannick Scherer <yannick.scherer@gmail.com>"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.source="https://github.com/into-docker/into-docker-clojure"
LABEL org.opencontainers.image.url="https://github.com/into-docker/into-docker-clojure"
LABEL org.opencontainers.image.revision="${COMMIT}"
LABEL org.opencontainers.image.created="${BUILD_DATE}"

LABEL org.into-docker.builder-user="${USER}"
LABEL org.into-docker.runner-image="adoptopenjdk/openjdk11:alpine-jre"
LABEL org.into-docker.runner-entrypoint="java -jar /opt/app.jar"

WORKDIR /into
ENV HOME="/into/home" LEIN_JVM_OPTS="-Duser.home=/into/home"
RUN useradd -d "${HOME}" -m "${USER}"
COPY into/ .