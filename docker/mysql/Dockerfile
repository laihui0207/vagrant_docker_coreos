############################################################
# Dockerfile to build MongoDB container images
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM laihui.base

# File Author / Maintainer
MAINTAINER laihui laihui0207gm@gmail.com 

# Update the repository sources list
RUN apt-get update

#RUN apt-get install -y  python python-dev libxml2 libxml2-dev libxslt1-dev python-pip git  Mercurial openssh-server ctags ncurses-dev curl
#RUN curl -sSL https://get.rvm.io | bash -s stable --ruby 
#RUN bash -c "source /etc/profile.d/rvm.sh"
#RUN apt-get install -y ruby-dev
##RUN . /usr/local/rvm/scripts/rvm
#RUN apt-get install nodejs npm -y
#RUN mkdir -p /root/workspace
#RUN cd /root/workspace; hg clone https://vim.googlecode.com/hg/ vim
#RUN cd /root/workspace/vim; ./configure --with-features=huge --enable-pythoninterp=yes --enable-rubyinterp=yes;make;make install
#RUN pip install lxml
#
#RUN mkdir /var/run/sshd
#RUN echo 'root:pass' |chpasswd
#RUN sed -i "s/PermitRootLogin without-password/#PermitRootLogin without-password/" /etc/ssh/sshd_config
#
##  install mysql 
#RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server pwgen

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*

# Add MySQL configuration
ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf

# Add MySQL scripts
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
ADD import_sql.sh /import_sql.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Exposed ENV
ENV MYSQL_USER admin
#ENV MYSQL_PASS **Random**
ENV MYSQL_PASS admin
# root password is root

# Add VOLUMEs to allow backup of config and databases
VOLUME  ["/etc/mysql", "/var/lib/mysql"]
RUN update-rc.d mysql defaults 
EXPOSE 3306
#EXPOSE 22

CMD ["/run.sh"]

#CMD ["/usr/sbin/sshd", "-D"]
