#!/bin/bash

cd /home/prometheus/

wget https://github.com/prometheus/prometheus/releases/download/v3.4.2/prometheus-3.4.2.linux-amd64.tar.gz

tar -xvzf prometheus-3.4.2.linux-amd64.tar.gz

cd prometheus-3.4.2.linux-amd64 && ./prometheus 

# tail -f /setup.sh
