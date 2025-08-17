# Домашнее задание к занятию «Управление доступом». Osipenkov AU


### Задание 1. Создайте конфигурацию для подключения пользователя

1. Создайте и подпишите SSL-сертификат для подключения к кластеру.

```
cp /var/snap/microk8s/current/certs/ca.crt ca.crt
cp /var/snap/microk8s/current/certs/ca.key ca.key
```

```
openssl genrsa -out netology.key 2048
openssl req -new -key netology.key -out netology.csr -subj "/CN=user/O=ops"
openssl x509 -req -in netology.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out netology.crt -days 500
openssl x509 -noout -text -in "netology.crt"
```
![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.4/img/1.1.JPG)


2. Настройте конфигурационный файл kubectl для подключения.

```
kubectl config set-credentials user --client-certificate=netology.crt --client-key=netology.key --embed-certs=true
kubectl config set-context user --cluster=microk8s-cluster --user=user
kubectl config use-context user
kubectl get nodes
kubectl config use-context microk8s
```
![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.4/img/2.1.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.4/img/2.1.1.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.4/img/2.1.2.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.4/img/2.1.3.JPG)

3. Создайте роли и все необходимые настройки для пользователя.

[role](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.4/mission1/role.yml)

[role-binding](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.4/mission1/role-binding.yml)

```
microk8s enable rbac

```

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.4/img/3.JPG)

4. Предусмотрите права пользователя. Пользователь может просматривать логи подов и их конфигурацию (`kubectl logs pod <pod_id>`, `kubectl describe pod <pod_id>`).

[pod](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.4/mission1/pod.yml)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.4/img/4.1.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.4/img/4.2.JPG)

5. Предоставьте манифесты и скриншоты и/или вывод необходимых команд.
