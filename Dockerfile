FROM openjdk:8-slim

ENV LANG=C.UTF-8 \
    PATH_TO_EMBULK=/opt/embulk \
    PATH=${PATH}:/opt/embulk

# Change timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get update && apt-get install -y curl vim git make

# Embulk install
RUN mkdir -p ${PATH_TO_EMBULK} \
    && curl --create-dirs -o ${PATH_TO_EMBULK}/embulk -L "https://dl.embulk.org/embulk-latest.jar" \
    && chmod +x ${PATH_TO_EMBULK}/embulk

# secret recipe from https://zenn.dev/fagai/scraps/c91658c3bc2d5e
# to install "embulk-output-bigquery" as of 2022/11/19
RUN embulk gem install jwt:2.3.0 public_suffix:4.0.7 multipart-post:2.1.1 jruby-openssl:0.10.7
RUN embulk gem install embulk-output-bigquery

RUN embulk gem install embulk-input-gcs embulk-output-gcs embulk-input-bigquery \
    embulk-filter-column embulk-filter-row \
    embulk-filter-add_time
