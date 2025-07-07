#!/bin/bash

cd /home/kibana/

curl https://artifacts.elastic.co/downloads/kibana/kibana-9.0.3-linux-x86_64.tar.gz > kibana.tar.gz

tar -xvzf /home/kibana/kibana.tar.gz
cat << EOF >> /home/kibana/kibana-9.0.3/config/kibana.yml
server.host: 0.0.0.0
server.port: 5601
EOF
./kibana-9.0.3/bin/kibana
