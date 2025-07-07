FROM debian:stable-slim

RUN apt update && apt install curl -y

COPY tools/setup.sh /
COPY tools/logstash.conf /logstash/logstash.conf

RUN adduser --home /home/logstash logstash && \
    adduser logstash root && \
    chmod +x /setup.sh

USER logstash

ENTRYPOINT [ "/setup.sh" ]