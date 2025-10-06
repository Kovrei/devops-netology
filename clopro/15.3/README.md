# Домашнее задание к занятию «Безопасность в облачных провайдерах». Osipenkov AU

Используя конфигурации, выполненные в рамках предыдущих домашних заданий, нужно добавить возможность шифрования бакета.

## Задание 1. Yandex Cloud
1. С помощью ключа в KMS необходимо зашифровать содержимое бакета:

**[backet.tf](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.3/src/backet.tf)**  

* создать ключ в KMS;

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.3/img/1.1.JPG)

* с помощью ключа зашифровать содержимое бакета, созданного ранее.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.3/img/1.2.JPG)

2. (Выполняется не в Terraform)* Создать статический сайт в Object Storage c собственным публичным адресом и сделать доступным по HTTPS:

* создать сертификат;
* создать статическую страницу в Object Storage и применить сертификат HTTPS;
* в качестве результата предоставить скриншот на страницу с сертификатом в заголовке (замочек).

**Для создания своей страницы были применины этапы:**
1. создан cloud dns test123.com

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.3/img/2.1.JPG?raw=true)

2. создан бакет с тем же test123.com

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.3/img/2.2.JPG?raw=true)

3. добавлен cloud dns test123.com в настройках бакета

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.3/img/2.3.JPG?raw=true)

4. добавление сертификата через бакет в блоке **безопасноть** вкладка **https**, которое при создании сертификата падает в ошибку, т.к. необходимо выполнить условия согласно инструкции, а именно создать файл и содержимое в бакете из блока HTTP-запись

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.3/img/2.4.JPG?raw=true)

5. выполнение условий п.4

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.3/img/2.5.JPG?raw=true)

6. добавление index.html в бакет

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.3/img/2.6.JPG?raw=true)


## Задание 2*. AWS (задание со звёздочкой)
Это необязательное задание. Его выполнение не влияет на получение зачёта по домашней работе.

Что нужно сделать

1. С помощью роли IAM записать файлы ЕС2 в S3-бакет:
* создать роль в IAM для возможности записи в S3 бакет;
* применить роль к ЕС2-инстансу;
с помощью bootstrap-скрипта записать в бакет файл веб-страницы.
2. Организация шифрования содержимого S3-бакета:
* используя конфигурации, выполненные в домашнем задании из предыдущего занятия, добавить к созданному ранее бакету S3 возможность шифрования Server-Side, используя общий ключ;
* включить шифрование SSE-S3 бакету S3 для шифрования всех вновь добавляемых объектов в этот бакет.
3. *Создание сертификата SSL и применение его к ALB:
* создать сертификат с подтверждением по email;
* сделать запись в Route53 на собственный поддомен, указав адрес LB;
* применить к HTTPS-запросам на LB созданный ранее сертификат.
Resource Terraform:

IAM Role.
AWS KMS.
S3 encrypt with KMS key.
Пример bootstrap-скрипта:

#!/bin/bash
yum install httpd -y
service httpd start
chkconfig httpd on
cd /var/www/html
echo "<html><h1>My cool web-server</h1></html>" > index.html
aws s3 mb s3://mysuperbacketname2021
aws s3 cp index.html s3://mysuperbacketname2021
