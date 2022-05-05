#!/usr/bin/env bash

echo " ************ START: POST INSTALL START ************ "

# 3ks permission
sudo chmod 644 /etc/rancher/k3s/k3s.yaml

# Add vagrant user to docker group
sudo usermod -aG docker vagrant

# Start docker
sudo systemctl start docker

sleep 60
echo "username: admin"
sleep 60
kubectl -n awx get secret awx-admin-password -o go-template='{{range $k,$v := .data}}{{printf "%s: " $k}}{{if not $v}}{{$v}}{{else}}{{$v | base64decode}}{{end}}{{"\n"}}{{end}}'

echo " ************ FINISHED ************ "