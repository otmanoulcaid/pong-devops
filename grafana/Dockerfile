FROM debian:stable-slim AS builder

RUN apt update && apt install curl -y && \
    curl https://dl.grafana.com/enterprise/release/grafana-enterprise-12.0.2.linux-amd64.tar.gz > /grafana.tar.gz \
    && tar -xvzf /grafana.tar.gz

FROM alpine:3.18

COPY --from=builder /grafana-v12.0.2/ /home/grafana/

RUN adduser -D -h /home/grafana grafana && \
    chown grafana:grafana /home/grafana

USER grafana
WORKDIR /home/grafana/bin

ENTRYPOINT [ "./grafana", "server" ]
