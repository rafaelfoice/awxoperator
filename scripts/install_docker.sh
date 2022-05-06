#!/usr/bin/env bash

echo " ************ START: Install Docker ************ "
# Docker install
curl -fsSL https://get.docker.com -o get-docker.sh

which docker
if [ $? -eq 0 ]
then
    docker --version | grep "Docker version"
    if [ $? -eq 0 ]
    then
        echo "docker existing"
    else
        sudo sh get-docker.sh
    fi
else
    sudo sh get-docker.sh
fi

echo " ************ FINISHED ************ "

