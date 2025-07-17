FROM debian:stable-slim AS builder

RUN apt update && apt install curl -y && \
    curl https://artifacts.elastic.co/downloads/logstash/logstash-9.0.3-linux-x86_64.tar.gz > /logstash.tar.gz && \
    tar -xvzf /logstash.tar.gz

FROM alpine:3.18

COPY --from=builder /logstash-9.0.3/ /home/logstash/

RUN adduser -D logstash && chown logstash:logstash /home/logstash

USER logstash
WORKDIR /home/logstash

ENTRYPOINT [ "./bin/logstash" ]
