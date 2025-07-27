# Домашнее задание к занятию «Хранение в K8s. Часть 2». Osipenkov AU

------

### Задание 1

**Что нужно сделать**

Создать Deployment приложения, использующего локальный PV, созданный вручную.

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.

[Deployment](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/mission1/deploy.yml)  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/img/1.1.JPG)

2. Создать PV и PVC для подключения папки на локальной ноде, которая будет использована в поде.

[PV](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/mission1/pv.yml)  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/img/1.2.1.JPG)

[PVC](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/mission1/pvc.yml)  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/img/1.2.2.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/img/1.2.JPG)

3. Продемонстрировать, что multitool может читать файл, в который busybox пишет каждые пять секунд в общей директории. 

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/img/1.3.JPG)

4. Удалить Deployment и PVC. Продемонстрировать, что после этого произошло с PV. Пояснить, почему.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/img/1.4.JPG)

**Статус PV изменен с Bound на Realesed, т.е. манифест отработан и сохранил данные согласно настройкам.**  

5. Продемонстрировать, что файл сохранился на локальном диске ноды. Удалить PV.  Продемонстрировать что произошло с файлом после удаления PV. Пояснить, почему.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/img/1.5.1.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/img/1.5.2.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/img/1.5.3.JPG)

**Файл сохранен на локальном диске НОДе, как резервная копия для повторного запуска комплекса Deployment, PV, PVC**  

6. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

------

### Задание 2

**Что нужно сделать**

Создать Deployment приложения, которое может хранить файлы на NFS с динамическим созданием PV.

1. Включить и настроить NFS-сервер на MicroK8S.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/img/2.1.JPG)

2. Создать Deployment приложения состоящего из multitool, и подключить к нему PV, созданный автоматически на сервере NFS.

[multitool](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/mission2/mooltitool.yml)  

[nfs](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/mission2/nfs.yml)  

[pvc](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/mission2/pvc.yml)  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/img/2.2.JPG?raw=true)

3. Продемонстрировать возможность чтения и записи файла изнутри пода.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/img/2.3.1.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.2/img/2.3.2.JPG?raw=true)

4. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

