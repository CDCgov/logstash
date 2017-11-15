#!/usr/bin/dumb-init /bin/sh

# This entrypoint script has been modified from the original
# If it is running as root, then it behaves exactly as the original version.
# However, if it is not running as the root user (id 0) then some tasks are
# skipped.

current_uid=`id -u`
desired_uid=${FLUENT_UID:-1000}

if [ ${current_uid} == 0 ]; then
	# check if a old fluent user exists and delete it
	cat /etc/passwd | grep fluent
	if [ $? -eq 0 ]; then
		deluser fluent
	fi

	# (re)add the fluent user with $FLUENT_UID
	adduser -D -g '' -u ${desired_uid} -h /home/fluent fluent
	
      	# chown home and data folder
	chown -R fluent /home/fluent
	chown -R fluent /fluentd

	exec su-exec fluent "$@"

	else
		exec "$@"
	fi

