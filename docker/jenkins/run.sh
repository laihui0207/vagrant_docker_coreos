#!/bin/bash
service sshd start
service jenkins start

function stop_svc {
service jenkins stop
service sshd stop
exit
}
trap 'stop_svc' SIGTERM
while true
do
	sleep 1
done
