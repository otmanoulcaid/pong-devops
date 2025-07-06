#!/bin/bash

curl https://artifacts.elastic.co/downloads/logstash/logstash-8.14.0-linux-x86_64.tar.gz > /opt/logstash.tar.gz

tar -xvzf /opt/logstash.tar.gz 

mv logstash-8.14.0 /opt/logstash
ln -s /opt/logstash/bin/logstash /bin/logstash


logstash -f /logstash/logstash.conf