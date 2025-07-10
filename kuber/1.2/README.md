
# Домашнее задание к занятию «Базовые объекты K8S». Osipenkov AU

### Чеклист готовности к домашнему заданию

1. Установленное k8s-решение (например, MicroK8S).  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.2/img/install_1.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.2/img/install_2.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.2/img/install_3.JPG?raw=true)

2. Установленный локальный kubectl.  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.2/img/install_4.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.2/img/install_5.JPG?raw=true)

3. Редактор YAML-файлов с подключенным Git-репозиторием.

------

### Задание 1. Создать Pod с именем hello-world

1. Создать манифест (yaml-конфигурацию) Pod.

[hello-word](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.2/pod/hello-word.yml)

2. Использовать image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.2/img/1.2.JPG?raw=true)

3. Подключиться локально к Pod с помощью `kubectl port-forward` и вывести значение (curl или в браузере).  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.2/img/1.3.1.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.2/img/1.3.2.JPG?raw=true)

------

### Задание 2. Создать Service и подключить его к Pod

1. Создать Pod с именем netology-web.

[netology-web](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.2/pod/netology-web.yml)

2. Использовать image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.2/img/2.2.JPG?raw=true)

3. Создать Service с именем netology-svc и подключить к netology-web.  

[netology-svc](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.2/svc/netology-svc.yml)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.2/img/2.3.JPG?raw=true)

4. Подключиться локально к Service с помощью `kubectl port-forward` и вывести значение (curl или в браузере).  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.2/img/2.4.1.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.2/img/2.4.2.JPG?raw=true)
