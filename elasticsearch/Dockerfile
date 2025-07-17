FROM debian:stable-slim AS builder

RUN apt update && apt install curl -y && \
    curl https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-9.0.3-linux-x86_64.tar.gz > /elasticsearch.tar.gz && \
    tar -xvzf /elasticsearch.tar.gz

FROM alpine:3.18

COPY --from=builder /elasticsearch-9.0.3/ /home/elasticsearch/

RUN adduser -D elasticsearch && chown elasticsearch:elasticsearch /home/elasticsearch

USER elasticsearch
WORKDIR /home/elasticsearch

ENTRYPOINT [ "./bin/elasticsearch" ]
