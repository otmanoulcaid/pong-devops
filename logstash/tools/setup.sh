#!/bin/bash

cd /home/logstash/

curl https://artifacts.elastic.co/downloads/logstash/logstash-9.0.3-linux-x86_64.tar.gz > logstash.tar.gz

tar -xvzf logstash.tar.gz

./logstash-9.0.3/bin/logstash -f /logstash/logstash.conf
