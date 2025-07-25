# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 2». Osipenkov AU

------

### Задание 1. Создать Deployment приложений backend и frontend

1. Создать Deployment приложения _frontend_ из образа nginx с количеством реплик 3 шт.

[fronted](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.5/mission1/d-nginx.yml)  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.5/img/1.1.JPG)

2. Создать Deployment приложения _backend_ из образа multitool. 

[backend](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.5/mission1/d-multitool.yml)  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.5/img/1.2.JPG)

3. Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера. 

[svc-fronted](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.5/mission1/svc-nginx.yml)  

[svc-backend](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.5/mission1/svc-multitool.yml)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.5/img/1.3.JPG)

4. Продемонстрировать, что приложения видят друг друга с помощью Service.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.5/img/1.4.1.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.5/img/1.4.2.JPG)

5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.
------

### Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера

1. Включить Ingress-controller в MicroK8S.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.5/img/2.1.1.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.5/img/2.1.2.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.5/img/2.1.3.JPG)

2. Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался _frontend_ а при добавлении /api - _backend_.

[Ingress](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.5/mission2/ingress.yml)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.5/img/2.2.1.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.5/img/2.2.2.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.5/img/2.2.3.JPG)

3. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.5/img/2.3.JPG)

4. Предоставить манифесты и скриншоты или вывод команды п.2.


