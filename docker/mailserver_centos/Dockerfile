# Based on centos 6 
############################################################

# Set the base image to Ubuntu
FROM laihui.centos

# File Author / Maintainer
MAINTAINER laihui laihui0207gm@gmail.com 

# Update the repository sources list
RUN yum clean all

RUN yum install -y postfix dovecot 
RUN chkconfig postfix on
RUN chkconfig dovecot on

EXPOSE 25
CMD ["/usr/sbin/sshd", "-D"]
