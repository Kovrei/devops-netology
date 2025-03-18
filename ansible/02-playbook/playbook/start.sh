#!/bin/bash


docker run -dt --name clickhouse-01 pycontribs/centos:7
docker run -dt --name vector-01 pycontribs/ubuntu

#docker start clickhouse-01
#docker start vector-01


#ansible-playbook ~/devops-netology/ansible/02-playbook/playbook/play.yml