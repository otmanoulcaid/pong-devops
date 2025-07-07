FROM debian:stable-slim

RUN apt update && apt install curl -y

COPY tools/setup.sh /
COPY tools/kibana.yml /kibana.yml

RUN adduser --home /home/kibana kibana && \
    adduser kibana root && \
    chmod +x /setup.sh


USER kibana

ENTRYPOINT [ "/setup.sh" ]
