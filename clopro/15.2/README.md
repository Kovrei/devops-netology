# Домашнее задание к занятию «Вычислительные мощности. Балансировщики нагрузки»

## Задание 1. Yandex Cloud

Что нужно сделать

1. Создать бакет Object Storage и разместить в нём файл с картинкой:

* Создать бакет в Object Storage с произвольным именем (например, имя_студента_дата).
* Положить в бакет файл с картинкой.
* Сделать файл доступным из интернета.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.2/img/1.1.JPG)

[backet.tf](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.2/src/backet.tf)

2. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

* Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать image_id = fd827b91d99psvq5fjit.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.2/img/2.1.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.2/img/2.2.JPG?raw=true)

* Для создания стартовой веб-страницы рекомендуется использовать раздел user_data в meta_data.

[meta.yml](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.2/src/meta.yml)

* Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.2/img/2.3.JPG)

* Настроить проверку состояния ВМ.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.2/img/2.7.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.2/img/2.4.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.2/img/2.5.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.2/img/2.6.JPG?raw=true)

[main.tf](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.2/src/main.tf)

3. Подключить группу к сетевому балансировщику:

* Создать сетевой балансировщик.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.2/img/3.1.JPG?raw=true)

* Проверить работоспособность, удалив одну или несколько ВМ.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.2/img/3.3.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.2/img/3.6.JPG?raw=true)

[lb.tf](https://github.com/Kovrei/devops-netology/blob/main/clopro/15.2/src/lb.tf)
4. (дополнительно)* Создать Application Load Balancer с использованием Instance group и проверкой состояния.

## Задание 2*. AWS (задание со звёздочкой)

Это необязательное задание. Его выполнение не влияет на получение зачёта по домашней работе.

Что нужно сделать

Используя конфигурации, выполненные в домашнем задании из предыдущего занятия, добавить к Production like сети Autoscaling group из трёх EC2-инстансов с автоматической установкой веб-сервера в private домен.

1. Создать бакет S3 и разместить в нём файл с картинкой:
Создать бакет в S3 с произвольным именем (например, имя_студента_дата).
Положить в бакет файл с картинкой.
Сделать доступным из интернета.
2. Сделать Launch configurations с использованием bootstrap-скрипта с созданием веб-страницы, на которой будет ссылка на картинку в S3.
3. Загрузить три ЕС2-инстанса и настроить LB с помощью Autoscaling Group.
Resource Terraform:

S3 bucket
Launch Template.
Autoscaling group.
Launch configuration.
Пример bootstrap-скрипта:

#!/bin/bash
yum install httpd -y
service httpd start
chkconfig httpd on
cd /var/www/html
echo "<html><h1>My cool web-server</h1></html>" > index.html
