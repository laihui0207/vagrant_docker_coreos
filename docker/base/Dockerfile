############################################################
# Dockerfile to build MongoDB container images
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER laihui laihui0207gm@gmail.com 

# Update the repository sources list
RUN apt-get update

RUN apt-get install -y  python python-dev libxml2 libxml2-dev libxslt1-dev python-pip git  mercurial openssh-server ctags ncurses-dev curl
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby 
RUN bash -c "source /etc/profile.d/rvm.sh"
RUN apt-get install -y ruby-dev
#RUN . /usr/local/rvm/scripts/rvm
RUN apt-get install nodejs npm -y
RUN mkdir -p /root/workspace
RUN cd /root/workspace; hg clone https://vim.googlecode.com/hg/ vim
RUN cd /root/workspace/vim; ./configure --with-features=huge --enable-pythoninterp=yes --enable-rubyinterp=yes;make;make install
RUN pip install lxml

RUN mkdir /var/run/sshd
RUN echo 'root:pass' |chpasswd
RUN sed -i "s/PermitRootLogin without-password/#PermitRootLogin without-password/" /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
