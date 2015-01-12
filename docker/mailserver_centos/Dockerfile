# Based on centos 6 
############################################################

# Set the base image to Ubuntu
FROM laihui.centos

# File Author / Maintainer
MAINTAINER laihui laihui0207gm@gmail.com 

# Update the repository sources list
RUN yum clean all

RUN yum install -y rsyslog postfix dovecot 
ADD postfix/main.cf /etc/postfix/main.cf
ADD postfix/dovecot.conf /etc/dovecot/dovecot.conf
ADD postfix/10-auth.conf /etc/dovecot/conf.d/10-auth.conf
ADD postfix/10-mail.conf /etc/dovecot/conf.d/10-mail.conf
ADD postfix/10-master.conf /etc/dovecot/conf.d/10-master.conf
ADD postfix/10-ssl.conf /etc/dovecot/conf.d/10-ssl.conf
ADD run.sh /run.sh
RUN chmod 755 /run.sh

EXPOSE 25
EXPOSE 110 
EXPOSE 143 
EXPOSE 22 
CMD ["/run.sh"]
