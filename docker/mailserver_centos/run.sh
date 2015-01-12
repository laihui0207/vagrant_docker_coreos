#!/bin/sh
# init-like script for the Geary testbed container
# Run tasks as jobs where possible, so we can wait on them.
#/usr/sbin/sshd -D &
#/usr/sbin/dovecot -F &
service rsyslog start
service sshd start
service postfix start
service dovecot start

function stop_svc {
service postfix stop
service rsyslog stop
service dovecot stop
service sshd stop
exit
}
trap 'stop_svc' SIGTERM
while true
do
	sleep 1
done
