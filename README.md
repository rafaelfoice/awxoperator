# Reference
https://computingforgeeks.com/how-to-install-ansible-awx-on-centos-7/

---

## Pre requirements** \
* Virtualbox version 6.1.34 [download and install](https://www.virtualbox.org/wiki/Changelog-6.1#v34)
* Vagrant - [download and install](https://www.vagrantup.com/downloads)
* Vagrant plugins\
```
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-vboxmanage
```
---

## Vagrant commands
* Vagrant Learning - [Hashicorp Vagrant](ttps://learn.hashicorp.com/vagrant)*
* To create your VM \
```
vagrant up
```
* To reload VM provision in case you change Vagrantfile
```
vagrant reload --provision
```
* SSH to your VM
```
vagrant ssh
```
* To destroy your VM
```
vagrant destroy
```
* To shut down your VM preserving the contents of disk
```
vagrant halt
```
* To suspend yout VM - quickly way to turn on again
```
vagrant suspend
```
---

## Vagrant box commands
* vagrant package --base [VM name - Defined on Vagrantfile] --output [name for your box]
 ```
 vagrant package --base awxoperator --output awxoperator.box
 ```
* vagrant box add [path to the box file] --name [name you want to have for your vagrant box] \
 ```
 vagrant box add centosk3s.box --name centosk3s
 ```
* Check vagrant box in your workstation
```
vagrant box list
```
* Remove a specific box 
```
 vagrant box remove -f centos3ks 
```
---
## To use this box:
### Check the version available [rafaelfoice](https://app.vagrantup.com/rafaelfoice/boxes/awxoperator)

### Create a Vagrantfile with the content:
```
Vagrant.configure("2") do |config|
  config.vm.box = "rafaelfoice/awxoperator"
  config.vm.box_version = "0.1.0"
  config.vm.network "private_network", ip: "192.168.50.10"
end
```
---
### Access AWX UI
#### **This can take minutes until all pods are up and running**\
#### * **Check the Vagrant up output to find the credentials**\
http://192.168.50.10:30080/#/login

---

### ssh into the vm or create a script and add the commands
#### check the folder test
```
vagrant ssh
# Add vagrant user to docker group
# Docker
sudo usermod -aG docker vagrant
sudo systemctl start docker

#k3s
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
```
### Check if k3s and docker is running
```
kubectl get nodes
docker ps -a
```

