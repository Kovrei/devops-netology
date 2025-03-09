#!/bin/bash

docker start clickhouse-01
docker start vector


#ansible-playbook ~/devops-netology/ansible/02-playbbok/playbook/site.yml -i ~/devops-netology/ansible/02-playbook/playbook/inventory/prod.yml