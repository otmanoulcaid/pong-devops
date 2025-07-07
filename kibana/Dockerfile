FROM debian:stable-slim

RUN apt update && apt install curl -y

COPY tools/setup.sh /

RUN adduser --home /home/kibana kibana && \
    adduser kibana root && \
    chmod +x /setup.sh

USER kibana

ENTRYPOINT [ "/setup.sh" ]
