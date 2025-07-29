#!/bin/bash
echo "DB_NAME ${DB_NAME}"
echo "DB_USER ${DB_USER}"
echo "DB_PASS ${DB_PASS}"
echo "DB_PORT ${DB_PORT}"

apt update
apt install -y mysql-server=8.0.42-0ubuntu0.20.04.1
apt install net-tools

mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mysql -e "CREATE USER '${DB_USER}'@'192.168.5.%' IDENTIFIED BY '${DB_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'192.168.5.%';"
mysql -e "FLUSH PRIVILEGES;"

sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i "s/^# port\s*=.*/port = ${DB_PORT}/" /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql