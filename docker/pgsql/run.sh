#!/bin/bash
POSTGRESQL_USER=${POSTGRESQL_USER:-"docker"}
POSTGRESQL_PASS=${POSTGRESQL_PASS:-"docker"}
POSTGRESQL_DB=${POSTGRESQL_DB:-"docker"}

POSTGRESQL_BIN_PATH=/usr/lib/postgresql/9.3/bin
POSTGRESQL_CONFIG_FILE=/etc/postgresql/9.3/main/postgresql.conf
POSTGRESQL_DATA=/data
chown -R postgres.postgres /data
chmod -R 700 /data

if find $POSTGRESQL_DATA -maxdepth 0 -empty | read v; then
	mkdir -p $POSTGRESQL_DATA
	chown -R postgres:postgres $POSTGRESQL_DATA
	sudo -u postgres $POSTGRESQL_BIN_PATH/initdb -D $POSTGRESQL_DATA
	#ln -s /etc/ssl/certs/ssl-cert-snakeoil.pem $POSTGRESQL_DATA/server.crt
	#ln -s /etc/ssl/private/ssl-cert-snakeoil.key $POSTGRESQL_DATA/server.key
	sudo -u postgres $POSTGRESQL_BIN_PATH/postgres --single --config-file=$POSTGRESQL_CONFIG_FILE <<< "CREATE USER $POSTGRESQL_USER WITH SUPERUSER;"
	sudo -u postgres $POSTGRESQL_BIN_PATH/postgres --single --config-file=$POSTGRESQL_CONFIG_FILE <<< "ALTER USER $POSTGRESQL_USER WITH PASSWORD '$POSTGRESQL_PASS';"
	sudo -u postgres $POSTGRESQL_BIN_PATH/postgres --single --config-file=$POSTGRESQL_CONFIG_FILE <<< "CREATE DATABASE $POSTGRESQL_DB OWNER $POSTGRESQL_USER;"
fi
exec sudo -u postgres $POSTGRESQL_BIN_PATH/postgres --config-file=$POSTGRESQL_CONFIG_FILE
