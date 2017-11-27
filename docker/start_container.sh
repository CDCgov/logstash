#!/bin/bash
# 1. initializes container with ENV variables set by OpenShift templates
# 2. starts up logstash


##### 1 #####
mv ${LOGSTASH_CONFIG}/logstash.yml ${LOGSTASH_CONFIG}/logstash.yml.old
sed "s|__ELASTICSEARCH_URL__|$ELASTICSEARCH_URL|g" ${LOGSTASH_CONFIG}/logstash.yml.tmpl > ${LOGSTASH_CONFIG}/logstash.yml
sed -i "s|__LOGSTASH_PIPELINE__|$LOGSTASH_PIPELINE|g" ${LOGSTASH_CONFIG}/logstash.yml
rm ${LOGSTASH_PIPELINE}/logstash.conf
sed "s|__ELASTICSEARCH_URL__|$ELASTICSEARCH_URL|g" ${LOGSTASH_PIPELINE}/logstash.conf.tmpl > ${LOGSTASH_PIPELINE}/logstash.conf
rm ${LOGSTASH_PIPELINE}/logstash.conf.tmpl

##### 2 #####
exec /usr/local/bin/docker-entrypoint

