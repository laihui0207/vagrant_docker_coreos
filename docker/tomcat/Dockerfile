# Based on centos 6 
############################################################

# Set the base image to Ubuntu
FROM laihui.centos

# File Author / Maintainer
MAINTAINER laihui laihui0207gm@gmail.com 

# add webex qa repo
RUN rm -rf /etc/yum.repos.d/
ADD yum.tar /etc/yum.repos.d
ADD run.sh /run.sh
RUN chmod +x /run.sh
# Update the repository sources list
RUN yum clean all
RUN yum install WBXjdk WBXtomcat -y
#RUN yum -y install WBXtomcat-7.0.30 
RUN mkdir -p /opt/tomcat/
RUN mkdir -p /opt/tomcat/logs

RUN chown wbx-tomcat.wbx-group /opt/tomcat -R

RUN rm -rf /opt/apache-tomcat_1/webapps
RUN ln -s /opt/tomcat/webapps /opt/apache-tomcat_1/webapps

RUN rm -rf /opt/apache-tomcat_1/logs
RUN ln -s /opt/tomcat/logs /opt/apache-tomcat_1/logs

RUN sed -i -e's/autoDeploy="false" deployOnStartup="false"/autoDeploy="true" deployOnStartup="true"/' /opt/apache-tomcat_1/conf/server.xml
#RUN sed -i -e's/port="8021"/port="8080"/' /opt/apache-tomcat_1/conf/server.xml
RUN sed -i -e's/<Listener className="org.apache.catalina.security.SecurityListener" \/>/<!-- Listener className="org.apache.catalina.security.SecurityListener" \/ -->/' /opt/apache-tomcat_1/conf/server.xml

VOLUME  ["/opt/tomcat/webapps"]
VOLUME  ["/opt/tomcat/logs"]

EXPOSE 8021
EXPOSE 22 
CMD ["/run.sh"]
