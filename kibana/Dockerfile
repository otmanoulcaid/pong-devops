FROM debian:stable-slim AS builder

RUN apt update && apt install curl -y && \
curl https://artifacts.elastic.co/downloads/kibana/kibana-9.0.3-linux-x86_64.tar.gz > /kibana.tar.gz && \
tar -xvzf /kibana.tar.gz

FROM alpine:3.18

COPY --from=builder /kibana-9.0.3/ /home/kibana/

RUN adduser -D kibana && chown kibana:kibana /home/kibana

USER kibana
WORKDIR /home/kibana

ENTRYPOINT [ "./bin/kibana" ]
