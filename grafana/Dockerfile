FROM debian:stable-slim

RUN apt update && apt install curl -y

COPY tools/setup.sh /

RUN adduser --home /home/grafana grafana && \
    adduser grafana root && \
    chmod +x /setup.sh


USER grafana

ENTRYPOINT [ "/setup.sh" ]