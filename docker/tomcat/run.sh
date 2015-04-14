#!/bin/bash
service sshd start
source /etc/profile
/opt/apache-tomcat_1/bin/startup.sh

function stop_svc {
#/opt/apache-tomcat_1/bin/shutdown.sh
pid=`ps -efww | grep "[f]ile=/opt/apache-tomcat_${i}" | awk '{ print $2 }'`
kill -9 $pid >/dev/null 2>&1
service sshd stop
exit
}
trap 'stop_svc' SIGTERM
while true
do
	sleep 1
done
