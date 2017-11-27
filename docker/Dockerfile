FROM docker.elastic.co/logstash/logstash:5.6.4

MAINTAINER Matt Bajzek <mbajzek@mitre.org>

# logstash image for OpenShift 3 which runs under the restricted (default) Security Context Constraints
#
# base image specified at https://github.com/elastic/logstash-docker/blob/master/templates/Dockerfile.j2

USER 0

ENV	LOGSTASH_HOME=/usr/share/logstash \
	LOGSTASH_CONFIG=/usr/share/logstash/config \
	LOGSTASH_PIPELINE=/usr/share/logstash/pipeline

COPY logstash.yml.tmpl ${LOGSTASH_CONFIG}
COPY logstash.conf.tmpl ${LOGSTASH_PIPELINE}
COPY start_container.sh ${LOGSTASH_HOME}

RUN	chown -R 1000:0 ${LOGSTASH_HOME}/{config,data,pipeline} \
	&& chmod -R g+rw ${LOGSTASH_HOME}/{config,data,pipeline}

USER 1000
ENTRYPOINT ["./start_container.sh"]

