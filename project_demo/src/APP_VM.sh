#!/bin/bash

FULL_PROJECT_DIR="/home/${PROJECT_DIR}"
FULL_APP_DIR="/home/${APP_DIR}"
echo "DB_NAME ${DB_NAME}"
echo "DB_USER ${DB_USER}"
echo "DB_PASS ${DB_PASS}"
echo "DB_PORT ${DB_PORT}"
echo "APP_USER ${APP_USER}"
echo "PROJECT_DIR ${PROJECT_DIR}"
echo "APP_DIR ${APP_DIR}"
echo "FULL_PROJECT_DIR ${FULL_PROJECT_DIR}"
echo "FULL_APP_DIR ${FULL_APP_DIR}"


apt update
apt install net-tools
apt install -y openjdk-17-jdk-headless
apt install -y git
apt install -y maven


useradd ${APP_USER} -d ${FULL_APP_DIR} -m


git clone https://github.com/spring-projects/spring-petclinic.git
mv spring-petclinic ${FULL_PROJECT_DIR}
mvn -f ${FULL_PROJECT_DIR} package
mv ${FULL_PROJECT_DIR}/target/spring-petclinic-3.5.0-SNAPSHOT.jar ${FULL_APP_DIR}/spring-petclinic-3.5.0-SNAPSHOT.jar


export MYSQL_URL="jdbc:mysql://${DB_HOST}:${DB_PORT}/${DB_NAME}"
export MYSQL_USER=${DB_USER}
export MYSQL_PASS=${DB_PASS}


sudo -u ${APP_USER} bash -c "java -jar -Dspring.datasource.url=${MYSQL_URL} -Dspring.datasource.username=${MYSQL_USER} -Dspring.datasource.password=${MYSQL_PASS} -Dspring.profiles.active=mysql ${FULL_APP_DIR}/spring-petclinic-3.5.0-SNAPSHOT.jar"
