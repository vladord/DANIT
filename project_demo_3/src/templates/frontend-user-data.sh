#!/bin/bash
apt update && apt install unzip curl -y

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

echo "${private_ssh_key}" > /home/ubuntu/generated_key
sudo chown ubuntu:ubuntu /home/ubuntu/generated_key
sudo chmod 600 /home/ubuntu/generated_key