FROM docker.elastic.co/logstash/logstash:5.6.4

MAINTAINER Matt Bajzek <mbajzek@mitre.org>

# logstash image for OpenShift 3 which runs under the restricted (default) Security Context Constraints
#
# base image specified at https://github.com/elastic/logstash-docker/blob/master/templates/Dockerfile.j2
#
# Volumes:
#  * TODO

USER 0

RUN	chgrp -R root /usr/share/logstash \
	&& chmod -R g+rw /usr/share/logstash 

USER 1000

