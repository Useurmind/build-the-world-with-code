#!/bin/bash

PG_USER=$1
PG_PASSWORD=$2
PG_HOST=$3
PG_DATABASE=$4
PG_CONNECTIONSTRING="user=$PG_USER password=$PG_PASSWORD host=$PG_HOST port=5432 dbname=$PG_DATABASE sslmode=disable"

sudo apt update 

sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install -y docker-ce

sudo systemctl status docker
# sudo usermod -aG docker ${USER}
# su - ${USER}

sudo docker run -d -e GOGREETING_DATASOURCE=$PG_CONNECTIONSTRING -p 8080:8080 useurmind/go-greeting:latest 