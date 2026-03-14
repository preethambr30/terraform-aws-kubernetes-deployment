#!/bin/bash

apt update -y

apt install docker.io -y
systemctl start docker
systemctl enable docker

curl -sfL https://get.k3s.io | sh -
