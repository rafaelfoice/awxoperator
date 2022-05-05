#!/usr/bin/env bash

echo " ************ START: POST INSTALL START ************ "

# 3ks permission
sudo chmod 644 /etc/rancher/k3s/k3s.yaml

# Add vagrant user to docker group
sudo usermod -aG docker vagrant

# Start docker
sudo systemctl start docker

echo "==> Clean up yum cache of metadata and packages to save space"
yum -y --enablerepo='*' clean all
sudo yum clean all

echo "==> Clear core files"
rm -f /core*

echo "==> Removing temporary files used to build box"
rm -rf /tmp/*

echo " ************ FINISHED ************ "