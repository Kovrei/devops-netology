# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 1». Osipenkov AU

------

### Задание 1. Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера

1. Создать Deployment приложения, состоящего из двух контейнеров (nginx и multitool), с количеством реплик 3 шт.

[Deployment](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.4/mission1/d-nginx-multitool.yml)  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.4/img/1.1.JPG)

2. Создать Service, который обеспечит доступ внутри кластера до контейнеров приложения из п.1 по порту 9001 — nginx 80, по 9002 — multitool 8080.

[Service](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.4/mission1/svc-nginx-multitool.yml)  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.4/img/1.2.JPG)

3. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложения из п.1 по разным портам в разные контейнеры.

[Pod](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.4/mission1/p-multitool.yml)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.4/img/1.3.JPG)

4. Продемонстрировать доступ с помощью `curl` по доменному имени сервиса.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.4/img/1.4.1.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.4/img/1.4.2.JPG)

5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.



------

### Задание 2. Создать Service и обеспечить доступ к приложениям снаружи кластера

1. Создать отдельный Service приложения из Задания 1 с возможностью доступа снаружи кластера к nginx, используя тип NodePort.

[Service](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.4/mission2/svc-nginx-multitool.yml)  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.4/img/2.1.JPG)

2. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.4/img/2.2.JPG)

3. Предоставить манифест и Service в решении, а также скриншоты или вывод команды п.2.



