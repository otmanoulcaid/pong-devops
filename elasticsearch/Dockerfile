FROM debian:stable-slim

RUN apt update && apt install curl -y

COPY tools/setup.sh /

RUN adduser --home /home/elasticsearch elasticsearch && \
    adduser elasticsearch root && \
    chmod +x /setup.sh

USER elasticsearch

ENTRYPOINT [ "/setup.sh" ]
