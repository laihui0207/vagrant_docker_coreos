############################################################
# Dockerfile to build base container images
# Based on centos 6 
############################################################

# Set the base image to Ubuntu
FROM centos:centos6 

# File Author / Maintainer
MAINTAINER laihui laihui0207gm@gmail.com 

# Update the repository sources list
RUN yum clean all

RUN yum install -y which tar wget git mercurial openssh-server ctags 
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby 
RUN bash -c "source /usr/local/rvm/scripts/rvm"
RUN yum install python-devel -y;
RUN yum install ruby-devel -y;
RUN yum install gcc-c++ openssl-devel -y; cd /usr/local/src;wget http://nodejs.org/dist/node-latest.tar.gz;tar xzvf node-latest.tar.gz;cd node-v*;./configure;make;make install
RUN mkdir -p /root/workspace
RUN cd /root/workspace; hg clone https://vim.googlecode.com/hg/ vim
RUN cd /root/workspace/vim; ./configure --with-features=huge --enable-pythoninterp=yes --enable-rubyinterp=yes;make;make install

RUN mkdir /var/run/sshd
RUN echo 'root:pass' |chpasswd
RUN sed -i "s/PermitRootLogin without-password/#PermitRootLogin without-password/" /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
