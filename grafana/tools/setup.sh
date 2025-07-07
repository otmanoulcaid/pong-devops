#!/bin/bash

cd /home/grafana/

curl https://dl.grafana.com/enterprise/release/grafana-enterprise-12.0.2.linux-amd64.tar.gz > /home/grafana/grafana.tar.gz

tar -zxvf grafana.tar.gz

cd grafana-v12.0.2/bin && ./grafana server
