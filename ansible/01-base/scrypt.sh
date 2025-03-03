#!/bin/bash

docker start ubuntu
docker start centos7
docker start fedora

ansible-playbook ~/devops-netology/ansible/01-base/playbook/site.yml -i ~/devops-netology/ansible/01-base/playbook/inventory/prod.yml

#docker stop ubuntu
#docker stop centos7
#docker stop fedora


