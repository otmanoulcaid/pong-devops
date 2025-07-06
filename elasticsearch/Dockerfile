FROM debian:stable-slim

RUN apt update && apt install curl -y

COPY tools/setup.sh /

RUN chmod +x setup.sh

ENTRYPOINT [ "/setup.sh" ]