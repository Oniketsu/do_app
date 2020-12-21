#!/bin/bash

apt-get -y update
apt-get -y install docker
docker pull oniketsu/
docker run -dit --name web-site -p 80:80 --restart always oniketsu/