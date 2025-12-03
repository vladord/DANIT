#!/bin/bash
apt update && apt install unzip curl net-tools openjdk-21-jdk-headless docker.io -y

usermod -aG docker ubuntu
systemctl restart docker

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install


echo "${public_ssh_key}" >> /home/ubuntu/.ssh/authorized_keys

sudo chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys
sudo chmod 600 /home/ubuntu/.ssh/authorized_keys