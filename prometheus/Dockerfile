FROM debian:stable-slim

RUN apt update && apt install wget -y

COPY tools/setup.sh /

RUN adduser --home /home/prometheus prometheus && \
    adduser prometheus root && \
    chmod +x /setup.sh


USER prometheus

ENTRYPOINT [ "/setup.sh" ]