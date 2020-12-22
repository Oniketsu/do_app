#!/bin/bash

apt-get -y update
apt-get -y install docker
docker pull oniketsu/flaskapp:latest
docker run -dit --name web-site -p 80:5000 --restart always oniketsu/flaskapp:latest
