# Домашнее задание к занятию «Хранение в K8s. Часть 1». Osipenkov AU

------

### Задание 1 

**Что нужно сделать**

Создать Deployment приложения, состоящего из двух контейнеров и обменивающихся данными.

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.

[Deployment](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.1/mission1/deploy.yml)  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.1/img/1.1.JPG)

2. Сделать так, чтобы busybox писал каждые пять секунд в некий файл в общей директории.
3. Обеспечить возможность чтения файла контейнером multitool.
4. Продемонстрировать, что multitool может читать файл, который периодоически обновляется.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.1/img/1.4.JPG?raw=true)

5. Предоставить манифесты Deployment в решении, а также скриншоты или вывод команды из п. 4.

------

### Задание 2

**Что нужно сделать**

Создать DaemonSet приложения, которое может прочитать логи ноды.

1. Создать DaemonSet приложения, состоящего из multitool.

[DaemonSet](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.1/mission2/demonset.yml)  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.1/img/2.1.JPG)

2. Обеспечить возможность чтения файла `/var/log/syslog` кластера MicroK8S.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.1/img/2.2.JPG)

3. Продемонстрировать возможность чтения файла изнутри пода.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.1/img/2.3.JPG)

4. Предоставить манифесты Deployment, а также скриншоты или вывод команды из п. 2.

------

### Правила приёма работы

1. Домашняя работа оформляется в своём Git-репозитории в файле README.md. Выполненное задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl`, а также скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.

------
