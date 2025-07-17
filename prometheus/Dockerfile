FROM debian:stable-slim AS builder

RUN apt update && apt install wget -y && \
    wget https://github.com/prometheus/prometheus/releases/download/v3.4.2/prometheus-3.4.2.linux-amd64.tar.gz && \
    tar -xvzf prometheus-3.4.2.linux-amd64.tar.gz

FROM alpine:3.18

COPY --from=builder /prometheus-3.4.2.linux-amd64/ /home/prometheus/

RUN adduser -D prometheus && chown prometheus:prometheus /home/prometheus

USER prometheus
WORKDIR /home/prometheus

ENTRYPOINT [ "./prometheus" ]
