FROM docker.elastic.co/logstash/logstash:5.6.4

MAINTAINER Matt Bajzek <mbajzek@mitre.org>

# logstash image for OpenShift 3 which runs under the restricted (default) Security Context Constraints
#
# base image specified at https://github.com/elastic/logstash-docker/blob/master/templates/Dockerfile.j2

USER 0

ENV	LOGSTASH_HOME=/usr/share/logstash \
	LOGSTASH_CONFIG=/usr/share/logstash/config

COPY logstash.yml.tmpl ${LOGSTASH_CONFIG}
COPY start_container.sh ${LOGSTASH_HOME}

RUN	chown -R 1000:0 ${LOGSTASH_HOME} \
	&& chmod -R g+rw ${LOGSTASH_HOME}

USER 1000
ENTRYPOINT ["./start_container.sh"]

