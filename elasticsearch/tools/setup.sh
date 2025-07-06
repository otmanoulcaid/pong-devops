#!/bin/bash

curl https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-9.0.3-linux-x86_64.tar.gz > /opt/elasticsearch.tar.gz

tar -xvzf /opt/elasticsearch.tar.gz

mv elasticsearch-9.0.3 /opt/elasticsearch
ln -s /opt/elasticsearch/bin/elasticsearch /bin/elasticsearch

elasticsearch