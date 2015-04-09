#!/bin/bash
service sshd start
source /etc/profile
/opt/apache-tomcat_1/bin/catalina.sh run 
