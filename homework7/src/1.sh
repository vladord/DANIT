#!/bin/bash
set -v
declare -a USERS_TO_CREATE=("dev1" "dev2" "dev3")
echo "CREATING USERS"
for USER in "${USERS_TO_CREATE[@]}"; do
        useradd $USER
        done
echo "CREATING GROUPS AND POPULATING THEM"
groupadd developers
groupadd webmasters

usermod -g developers dev1
usermod -g developers dev2
usermod -g webmasters dev3

for USER in "${USERS_TO_CREATE[@]}"; do
        usermod -aG $USER $USER
        done
echo "MAKING HOME DIRECTORIES"
for USER in "${USERS_TO_CREATE[@]}"; do
        mkhomedir_helper $USER
        done

echo "MAKING BACKUP"
useradd backupdev
mkhomedir_helper backupdev
rsync -Hav --include ~dev1/ ~backupdev/
chown -R backupdev:backupdev ~backupdev
echo "MAKING GROUP PROJECT"
mkdir /home/web_project
chown root:developers /home/web_project
echo "MAKING LOG FILE"
touch /home/my.log
chattr -a /home/my.log