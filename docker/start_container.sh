#!/bin/bash
# 1. initializes container with ENV variables set by OpenShift templates:
#       - ${ELASTICSSEARCH_URL} -> elasticsearch.url
# 2. starts up logstash


##### 1 #####
mv ${LOGSTASH_CONFIG}/logstash.yml ${LOGSTASH_CONFIG}/logstash.yml.old
sed "s|__ELASTICSEARCH_URL__|$ELASTICSEARCH_URL|g" ${LOGSTASH_CONFIG}/logstash.yml.tmpl > ${LOGSTASH_CONFIG}/logstash.yml

##### 2 #####
exec /usr/local/bin/docker-entrypoint

