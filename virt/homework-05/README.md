# Домашнее задание к занятию 5. «Практическое применение Docker». Осипенков АЮ

## Задача 0
1. Убедитесь что у вас НЕ(!) установлен ```docker-compose```, для этого получите следующую ошибку от команды ```docker-compose --version```
```
Command 'docker-compose' not found, but can be installed with:

sudo snap install docker          # version 24.0.5, or
sudo apt  install docker-compose  # version 1.25.0-1

See 'snap info docker' for additional versions.
```
В случае наличия установленного в системе ```docker-compose``` - удалите его.  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.JPG?raw=true)

2. Убедитесь что у вас УСТАНОВЛЕН ```docker compose```(без тире) версии не менее v2.24.X, для это выполните команду ```docker compose version```  
###  **Своё решение к задачам оформите в вашем GitHub репозитории!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!**

---

## Задача 1
1. Сделайте в своем github пространстве fork [репозитория](https://github.com/netology-code/shvirtd-example-python/blob/main/README.md).
   Примечание: В связи с доработкой кода python приложения. Если вы уверены что задание выполнено вами верно, а код python приложения работает с ошибкой то используйте вместо main.py файл old_main.py(просто измените CMD)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.1.1.JPG)

2. Создайте файл с именем ```Dockerfile.python``` для сборки данного проекта(для 3 задания изучите https://docs.docker.com/compose/compose-file/build/ ). Используйте базовый образ ```python:3.9-slim```. 
Обязательно используйте конструкцию ```COPY . .``` в Dockerfile. Не забудьте исключить ненужные в имадже файлы с помощью dockerignore. Протестируйте корректность сборки.

[Dockerfile.python](https://github.com/Kovrei/shvirtd-example-python/blob/main/Dockerfile.python)  
[.dockerignore](https://github.com/Kovrei/shvirtd-example-python/blob/main/.dockerignore)  
[.gitignore](https://github.com/Kovrei/shvirtd-example-python/blob/main/.gitignore)  

```
docker build -t python:3.9-slim -f Dockerfile.python .
```
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.1.2.JPG?raw=true)

**Прошу уточнить "Протестируйте корректность сборки" каким образом. 
Ведь сборка после run в статусе exited**  

3. (Необязательная часть, *) Изучите инструкцию в проекте и запустите web-приложение без использования docker в venv. (Mysql БД можно запустить в docker run).
4. (Необязательная часть, *) По образцу предоставленного python кода внесите в него исправление для управления названием используемой таблицы через ENV переменную.
---
### ВНИМАНИЕ!
!!! В процессе последующего выполнения ДЗ НЕ изменяйте содержимое файлов в fork-репозитории! Ваша задача ДОБАВИТЬ 5 файлов: ```Dockerfile.python```, ```compose.yaml```, ```.gitignore```, ```.dockerignore```,```bash-скрипт```. Если вам понадобилось внести иные изменения в проект - вы что-то делаете неверно!
---

## Задача 2 (*)
1. Создайте в yandex cloud container registry с именем "test" с помощью "yc tool" . [Инструкция](https://cloud.yandex.ru/ru/docs/container-registry/quickstart/?from=int-console-help)
2. Настройте аутентификацию вашего локального docker в yandex container registry.
3. Соберите и залейте в него образ с python приложением из задания №1.
4. Просканируйте образ на уязвимости.
5. В качестве ответа приложите отчет сканирования.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.2.JPG)

## Задача 3
1. Изучите файл "proxy.yaml"
2. Создайте в репозитории с проектом файл ```compose.yaml```. С помощью директивы "include" подключите к нему файл "proxy.yaml".
3. Опишите в файле ```compose.yaml``` следующие сервисы: 

- ```web```. Образ приложения должен ИЛИ собираться при запуске compose из файла ```Dockerfile.python``` ИЛИ скачиваться из yandex cloud container registry(из задание №2 со *). Контейнер должен работать в bridge-сети с названием ```backend``` и иметь фиксированный ipv4-адрес ```172.20.0.5```. Сервис должен всегда перезапускаться в случае ошибок.
Передайте необходимые ENV-переменные для подключения к Mysql базе данных по сетевому имени сервиса ```web``` 

- ```db```. image=mysql:8. Контейнер должен работать в bridge-сети с названием ```backend``` и иметь фиксированный ipv4-адрес ```172.20.0.10```. Явно перезапуск сервиса в случае ошибок. Передайте необходимые ENV-переменные для создания: пароля root пользователя, создания базы данных, пользователя и пароля для web-приложения.Обязательно используйте уже существующий .env file для назначения секретных ENV-переменных!

[compose.yml](https://github.com/Kovrei/shvirtd-example-python/blob/main/compose.yml)  
[.env](https://github.com/Kovrei/shvirtd-example-python/blob/main/.env)

4. Запустите проект локально с помощью docker compose , добейтесь его стабильной работы: команда ```curl -L http://127.0.0.1:8090``` должна возвращать в качестве ответа время и локальный IP-адрес. Если сервисы не стартуют воспользуйтесь командами: ```docker ps -a ``` и ```docker logs <container_name>``` . Если вместо IP-адреса вы получаете ```NULL``` --убедитесь, что вы шлете запрос на порт ```8090```, а не 5000.

```
docker compose up -d
```
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.3.4.JPG)


5. Подключитесь к БД mysql с помощью команды ```docker exec -ti <имя_контейнера> mysql -uroot -p<пароль root-пользователя>```(обратите внимание что между ключем -u и логином root нет пробела. это важно!!! тоже самое с паролем) . Введите последовательно команды (не забываем в конце символ ; ): ```show databases; use <имя вашей базы данных(по-умолчанию example)>; show tables; SELECT * from requests LIMIT 10;```.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.3.5.1.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.3.5.2.JPG?raw=true)


6. Остановите проект. В качестве ответа приложите скриншот sql-запроса.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.3.6.JPG?raw=true)

## Задача 4
1. Запустите в Yandex Cloud ВМ (вам хватит 2 Гб Ram).
[terraform apply --auto-approve]([https://github.com/Kovrei/devops-netology/tree/main/virt/homework-05/vm)  
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.4.1.JPG?raw=true)

2. Подключитесь к Вм по ssh и установите docker.
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.4.2.JPG?raw=true)

3. Напишите bash-скрипт, который скачает ваш fork-репозиторий в каталог /opt и запустит проект целиком.
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.4.3.JPG?raw=true)

4. Зайдите на сайт проверки http подключений, например(или аналогичный): ```https://check-host.net/check-http``` и запустите проверку вашего сервиса ```http://<внешний_IP-адрес_вашей_ВМ>:8090```. Таким образом трафик будет направлен в ingress-proxy. ПРИМЕЧАНИЕ:  приложение(old_main.py) весьма вероятно упадет под нагрузкой, но успеет обработать часть запросов - этого достаточно. Обновленная версия (main.py) не прошла достаточного тестирования временем, но должна справиться с нагрузкой.
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.4.4.1.JPG?raw=true)
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.4.4.2.JPG?raw=true)

5. (Необязательная часть) Дополнительно настройте remote ssh context к вашему серверу. Отобразите список контекстов и результат удаленного выполнения ```docker ps -a```
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.4.5.JPG?raw=true)

6. В качестве ответа повторите  sql-запрос и приложите скриншот с данного сервера, bash-скрипт и ссылку на fork-репозиторий.
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.4.6.1.JPG?raw=true)
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.4.6.2.JPG?raw=true)

## Задача 5 (*)
1. Напишите и задеплойте на вашу облачную ВМ bash скрипт, который произведет резервное копирование БД mysql в директорию "/opt/backup" с помощью запуска в сети "backend" контейнера из образа ```schnitzler/mysqldump``` при помощи ```docker run ...``` команды. Подсказка: "документация образа."
[terraform apply --auto-approve]([https://github.com/Kovrei/devops-netology/tree/main/virt/homework-05/vm)  
[start scripts](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/script/hw-05.md)

[ssh -o StrictHostKeyChecking=no vm1@51.250.94.174 'bash -s' < git_clone.sh](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/script/git_clone.sh)  
[ssh vm1@51.250.94.174 'bash -s' < docker_install.sh](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/script/docker_install.sh)  
[scp secret.env vm1@51.250.94.174:/opt/backup/](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/script/secret.env)  
[scp docker_mysqldump.sh vm1@51.250.94.174:/opt/backup/](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/script/docker_mysqldump.sh)  
[ssh vm1@51.250.94.174 'bash -s' < docker_mysqldump.sh](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/script/docker_mysqldump.sh)  

2. Протестируйте ручной запуск
3. Настройте выполнение скрипта раз в 1 минуту через cron, crontab или systemctl timer. Придумайте способ не светить логин/пароль в git!!
[ssh -t crontab -e vm1@51.250.94.174](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/script/hw-05.md)
[scp secret.env vm1@51.250.94.174:/opt/backup/](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/script/secret.env)
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.5.2.JPG?raw=true)

4. Предоставьте скрипт, cron-task и скриншот с несколькими резервными копиями в "/opt/backup"
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/5.5.1.JPG?raw=true)
## Задача 6
Скачайте docker образ ```hashicorp/terraform:latest``` и скопируйте бинарный файл ```/bin/terraform``` на свою локальную машину, используя dive и docker save.
Предоставьте скриншоты  действий .
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/6.0.1.JPG?raw=true)
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/6.0.2.JPG?raw=true)
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/6.0.3.JPG?raw=true)
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/6.0.4.JPG?raw=true)
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/6.0.5.JPG?raw=true)

## Задача 6.1
Добейтесь аналогичного результата, используя docker cp.  
Предоставьте скриншоты  действий .
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/6.1.1.JPG?raw=true)  
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/6.1.2.JPG?raw=true)  

## Задача 6.2 (**)
Предложите способ извлечь файл из контейнера, используя только команду docker build и любой Dockerfile.  
Предоставьте скриншоты  действий .
![alt text](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/img/6.2.JPG?raw=true)  
[Dockerfile](https://github.com/Kovrei/devops-netology/blob/main/virt/homework-05/Dockerfile)  
## Задача 7 (***)
Запустите ваше python-приложение с помощью runC, не используя docker или containerd.  
Предоставьте скриншоты  действий .
