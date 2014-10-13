############################################################
# Dockerfile to build MongoDB container images
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM laihui.base 

# File Author / Maintainer
MAINTAINER laihui laihui0207gm@gmail.com 

# Add PostgreSQL's repository. It contains the most recent stable release
#     of PostgreSQL, ``9.3``.
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

# Update the Ubuntu and PostgreSQL repository indexes
RUN apt-get update

# Install ``python-software-properties``, ``software-properties-common`` and PostgreSQL 9.3
#  There are some warnings (in red) that show up during the build. You can hide
#  them by prefixing each apt-get statement with DEBIAN_FRONTEND=noninteractive
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --force-yes -q install python-software-properties software-properties-common
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --force-yes -q install postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3

# Install other tools.
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y pwgen inotify-tools

ADD run.sh /run.sh
RUN chmod 755 /*.sh
RUN mkdir -p /data
RUN chown -R postgres:postgres /data
RUN chmod -R 755 /data

# Cofigure the database to use our data dir.
RUN sed -i -e"s/data_directory =.*$/data_directory = '\/data'/" /etc/postgresql/9.3/main/postgresql.conf
# Allow connections from anywhere.
RUN sed -i -e"s/^#listen_addresses =.*$/listen_addresses = '*'/" /etc/postgresql/9.3/main/postgresql.conf
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf

# Expose the PostgreSQL port
EXPOSE 5432
#EXPOSE 22

## Add VOLUMEs to allow backup of config, logs and databases
#VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql","/data"]
VOLUME  ["/data"]

CMD ["/run.sh"]
