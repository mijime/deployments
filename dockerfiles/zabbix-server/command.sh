#!/bin/bash -e

# setup files
mkdir -p /var/run/zabbix
ln -sf /proc/self/fd/1 /var/log/zabbix/zabbix_server.log
chown zabbix /var/run/zabbix /var/log/zabbix/zabbix_server.log

# created config file
export ZABBIX_SERVER_LOGFILE_SIZE=${ZABBIX_SERVER_LOGFILE_SIZE:-1}
export ZABBIX_SERVER_DEBUG_LEVEL=${ZABBIX_SERVER_DEBUG_LEVEL:-3}
export ZABBIX_SERVER_TIMEOUT=${ZABBIX_SERVER_TIMEOUT:-30}
export ZABBIX_DB_HOST=${ZABBIX_DB_HOST:-${DB_PORT_3306_TCP_ADDR}}
export ZABBIX_DB_PORT=${ZABBIX_DB_PORT:-3306}
export ZABBIX_DB_NAME=${ZABBIX_DB_NAME:-zabbix}
export ZABBIX_DB_USER=${ZABBIX_DB_USER:-root}
export ZABBIX_DB_PASSWORD=${ZABBIX_DB_PASSWORD:-}
export CONFD_BACKEND=${CONFD_BACKEND:-env}
confd -onetime -backend ${CONFD_BACKEND}

# setup db
/install.sh

# execute
zabbix_server

# check process
while sleep 1
do [[ -f /var/run/zabbix/zabbix_server.pid ]] || exit 1
done
