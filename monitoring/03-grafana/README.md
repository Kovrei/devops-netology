# Домашнее задание к занятию 14 «Средство визуализации Grafana». Osipenkov AU

## Задание повышенной сложности

**При решении задания 1** не используйте директорию [help](./help) для сборки проекта. Самостоятельно разверните grafana, где в роли источника данных будет выступать prometheus, а сборщиком данных будет node-exporter:

- grafana;
- prometheus-server;
- prometheus node-exporter.

За дополнительными материалами можете обратиться в официальную документацию grafana и prometheus.

В решении к домашнему заданию также приведите все конфигурации, скрипты, манифесты, которые вы 
использовали в процессе решения задания.

**При решении задания 3** вы должны самостоятельно завести удобный для вас канал нотификации, например, Telegram или email, и отправить туда тестовые события.

В решении приведите скриншоты тестовых событий из каналов нотификаций.

## Обязательные задания

### Задание 1

<details><summary>1. Используя директорию [help](./help) внутри этого домашнего задания, запустите связку prometheus-grafana.</summary>

![alt text](https://github.com/Kovrei/devops-netology/blob/main/monitoring/03-grafana/help/img/3.1.1.JPG?raw=true)
</details>

<details><summary>2. Зайдите в веб-интерфейс grafana, используя авторизационные данные, указанные в манифесте docker-compose.</summary>

![alt text](https://github.com/Kovrei/devops-netology/blob/main/monitoring/03-grafana/help/img/3.1.2.JPG?raw=true)
</details>

<details><summary>3. Подключите поднятый вами prometheus, как источник данных.</summary>

![alt text](https://github.com/Kovrei/devops-netology/blob/main/monitoring/03-grafana/help/img/3.1.3.JPG?raw=true)
</details>

4. Решение домашнего задания — скриншот веб-интерфейса grafana со списком подключенных Datasource.
![alt text](https://github.com/Kovrei/devops-netology/blob/main/monitoring/03-grafana/help/img/3.1.4.JPG?raw=true)



## Задание 2

Изучите самостоятельно ресурсы:

1. [PromQL tutorial for beginners and humans](https://valyala.medium.com/promql-tutorial-for-beginners-9ab455142085).
2. [Understanding Machine CPU usage](https://www.robustperception.io/understanding-machine-cpu-usage).
3. [Introduction to PromQL, the Prometheus query language](https://grafana.com/blog/2020/02/04/introduction-to-promql-the-prometheus-query-language/).

Создайте Dashboard и в ней создайте Panels:

- утилизация CPU для nodeexporter (в процентах, 100-idle);  
`100 - (avg by (instance) (rate(node_cpu_seconds_total{job="nodeexporter",mode="idle"}[1m])) * 100)`

- CPULA 1/5/15;  
`node_load1{job="nodeexporter"}
node_load5{job="nodeexporter"}
node_load15{job="nodeexporter"}`

- количество свободной оперативной памяти;  
`node_memory_MemFree_bytes{job='nodeexporter'}`

- количество места на файловой системе.  
`node_filesystem_size_bytes{device="/dev/sda3", fstype="ext4", instance="nodeexporter:9100", job="nodeexporter", mountpoint="/"}`

Для решения этого задания приведите promql-запросы для выдачи этих метрик, а также скриншот получившейся Dashboard.
![alt text](https://github.com/Kovrei/devops-netology/blob/main/monitoring/03-grafana/help/img/3.2.JPG?raw=true)

## Задание 3

<details><summary>1. Создайте для каждой Dashboard подходящее правило alert — можно обратиться к первой лекции в блоке «Мониторинг».</summary>

![alt text](https://github.com/Kovrei/devops-netology/blob/main/monitoring/03-grafana/help/img/3.3.2.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/monitoring/03-grafana/help/img/3.3.3.JPG?raw=true)
</details>

2. В качестве решения задания приведите скриншот вашей итоговой Dashboard.  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/monitoring/03-grafana/help/img/3.3.1.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/monitoring/03-grafana/help/img/3.3.4.JPG?raw=true)


## Задание 4

1. Сохраните ваш Dashboard.Для этого перейдите в настройки Dashboard, выберите в боковом меню «JSON MODEL». Далее скопируйте отображаемое json-содержимое в отдельный файл и сохраните его.
2. В качестве решения задания приведите листинг этого файла.

[json model Dashboard](https://github.com/Kovrei/devops-netology/blob/main/monitoring/03-grafana/help/prometheus/dashboard.json)

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
