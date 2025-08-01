# Домашнее задание к занятию 15 «Система сбора логов Elastic Stack». Osipenkov AU

## Задание 1

Вам необходимо поднять в докере и связать между собой:

- elasticsearch (hot и warm ноды);
- logstash;
- kibana;
- filebeat.

Logstash следует сконфигурировать для приёма по tcp json-сообщений.

Filebeat следует сконфигурировать для отправки логов docker вашей системы в logstash.

В директории [help](./help) находится манифест docker-compose и конфигурации filebeat/logstash для быстрого 
выполнения этого задания.

Результатом выполнения задания должны быть:

- скриншот `docker ps` через 5 минут после старта всех контейнеров (их должно быть 5);

![alt text](https://github.com/Kovrei/devops-netology/blob/main/monitoring/04-elk/img/4.1.1.JPG?raw=true)

- скриншот интерфейса kibana;

![alt text](https://github.com/Kovrei/devops-netology/blob/main/monitoring/04-elk/img/4.1.2.JPG?raw=true)

- docker-compose манифест (если вы не использовали директорию help);
- ваши yml-конфигурации для стека (если вы не использовали директорию help).

## Задание 2

Перейдите в меню [создания index-patterns  в kibana](http://localhost:5601/app/management/kibana/indexPatterns/create) и создайте несколько index-patterns из имеющихся.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/monitoring/04-elk/img/4.2.1.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/monitoring/04-elk/img/4.2.2.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/monitoring/04-elk/img/4.2.3.JPG?raw=true)

Перейдите в меню просмотра логов в kibana (Discover) и самостоятельно изучите, как отображаются логи и как производить поиск по логам.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/monitoring/04-elk/img/4.2.4.JPG?raw=true)

В манифесте директории help также приведенно dummy-приложение, которое генерирует рандомные события в stdout-контейнера.
Эти логи должны порождать индекс logstash-* в elasticsearch. Если этого индекса нет — воспользуйтесь советами и источниками из раздела «Дополнительные ссылки» этого задания.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---

 
