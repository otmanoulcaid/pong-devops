#!/bin/bash

cd /home/elasticsearch/

curl https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-9.0.3-linux-x86_64.tar.gz > elasticsearch.tar.gz

tar -xvzf /home/elasticsearch/elasticsearch.tar.gz

cat << EOF > /home/elasticsearch/elasticsearch-9.0.3/config/elasticsearch.yml
network.host: 0.0.0.0
http.port: 9200
discovery.type: single-node
xpack.security.enabled: false
xpack.security.http.ssl.enabled: false

EOF

./elasticsearch-9.0.3/bin/elasticsearch
