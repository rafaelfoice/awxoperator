#!/usr/bin/env bash

echo " ************ START: AWX OPERATOR ************ "
systemctl status k3s

sudo systemctl disable firewalld --now
sudo setenforce 0
sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config
cat /etc/selinux/config | grep SELINUX=

echo "Clone awx-operator"
cd
rm -r awx-operator
git clone https://github.com/ansible/awx-operator.git
cd awx-operator
RELEASE_TAG=`curl -s https://api.github.com/repos/ansible/awx-operator/releases/tags/0.21.0| grep tag_name | cut -d '"' -f 4`
echo $RELEASE_TAG
git checkout $RELEASE_TAG

export NAMESPACE=awx
kubectl create namespace ${NAMESPACE}
make deploy

kubectl apply -f /vagrant/scripts/awx/persistenceVolumeClaim.yaml
kubectl apply -f /vagrant/scripts/awx/awx-deploy.yaml
#kubectl exec -ti deploy/awx  -c  awx-task -- /bin/bash
#kubectl exec -ti deploy/awx  -c  awx-ee -- /bin/bash
#kubectl exec -ti deploy/awx  -c  redis -- /bin/bash
#kubectl exec -ti deploy/awx  -c  awx-web -- /bin/bash
kubectl get deploy -n awx
kubectl get svc -n awx
echo "Wait some minutes to access GUI - pod still initializing ..."
kubectl get pods -n awx
echo "username: admin"
sleep 60
kubectl -n awx get secret awx-admin-password -o go-template='{{range $k,$v := .data}}{{printf "%s: " $k}}{{if not $v}}{{$v}}{{else}}{{$v | base64decode}}{{end}}{{"\n"}}{{end}}'

echo " ************ FINISHED ************ "
