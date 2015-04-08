#!/bin/bash
#-Dcom.sun.akuma.Daemon=daemonized --daemon
exec /usr/java/bin/java  -Djava.awt.headless=true -DJENKINS_HOME=/opt/jenkins/home -jar /usr/lib/jenkins/jenkins.war --logfile=/opt/jenkins/logs/jenkins.log --webroot=/var/cache/jenkins/war  --httpPort=8080 --ajp13Port=8009 --debug=2 --handlerCountMax=500 --handlerCountMaxIdle=50 --prefix=/jenkins
