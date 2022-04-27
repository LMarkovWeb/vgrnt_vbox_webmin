#!/bin/bash

echo "[TASK 1] Update"
yum update -y

echo "[TASK 2] Install utilites"
yum install vim mc -y

echo "[TASK 3] Add repo"
cat >/etc/yum.repos.d/webmin.repo<<EOF
[Webmin]
name=Webmin Distribution Neutral
#baseurl=http://download.webmin.com/download/yum
mirrorlist=http://download.webmin.com/download/yum/mirrorlist
enabled=1
EOF

echo "[TASK 4] Import GPG key"
rpm --import http://www.webmin.com/jcameron-key.asc

echo "[TASK 5] Change root password"
sudo chpasswd <<<"root:root"

echo "[TASK 6] Install webmin"
yum install -y webmin

echo "Go to https://127.0.0.1:10000/ on host machine. User root."