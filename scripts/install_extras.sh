#!/usr/bin/env bash

echo " ************ START: Install extras ************ "
yum install epel-release -y
yum update -y
sudo yum -y install git 
sudo yum -y install curl 
sudo yum -y install jq

echo " ************ FINISHED ************ "
