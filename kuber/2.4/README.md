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
![alt text]()


2. Настройте конфигурационный файл kubectl для подключения.

```
kubectl config set-credentials user --client-certificate=netology.crt --client-key=netology.key --embed-certs=true
kubectl config set-context user --cluster=microk8s-cluster --user=user
kubectl config use-context user
kubectl get nodes
kubectl config use-context microk8s
```
![alt text]()

![alt text]()

![alt text]()

![alt text]()

3. Создайте роли и все необходимые настройки для пользователя.

[role]()
[role-binding]()

```
microk8s enable rbac

```

![alt text]()

4. Предусмотрите права пользователя. Пользователь может просматривать логи подов и их конфигурацию (`kubectl logs pod <pod_id>`, `kubectl describe pod <pod_id>`).

[pod]()

![alt text]()

![alt text]()

5. Предоставьте манифесты и скриншоты и/или вывод необходимых команд.