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

<details><summary>1. Используя директорию [help](./help) внутри этого домашнего задания, запустите связку prometheus-grafana.<details><summary>
![alt text]()
</details>

<details><summary>2. Зайдите в веб-интерфейс grafana, используя авторизационные данные, указанные в манифесте docker-compose.<details><summary>
![alt text]()
</details>
<details><summary>3. Подключите поднятый вами prometheus, как источник данных.<details><summary>
![alt text]()
</details>

<details><summary>4. Решение домашнего задания — скриншот веб-интерфейса grafana со списком подключенных Datasource.<details><summary>
![alt text]()
</details>

## Задание 2

Изучите самостоятельно ресурсы:

1. [PromQL tutorial for beginners and humans](https://valyala.medium.com/promql-tutorial-for-beginners-9ab455142085).
2. [Understanding Machine CPU usage](https://www.robustperception.io/understanding-machine-cpu-usage).
3. [Introduction to PromQL, the Prometheus query language](https://grafana.com/blog/2020/02/04/introduction-to-promql-the-prometheus-query-language/).

Создайте Dashboard и в ней создайте Panels:

<details><summary>- утилизация CPU для nodeexporter (в процентах, 100-idle);<summary>

</details>

<details><summary>- CPULA 1/5/15;<summary>
</details>
<details><summary>- количество свободной оперативной памяти;<summary>
</details>
<details><summary>- количество места на файловой системе.<summary>
</details>

Для решения этого задания приведите promql-запросы для выдачи этих метрик, а также скриншот получившейся Dashboard.

## Задание 3

<details><summary>1. Создайте для каждой Dashboard подходящее правило alert — можно обратиться к первой лекции в блоке «Мониторинг».<summary>
![alt text]()
</details>

<details><summary>2. В качестве решения задания приведите скриншот вашей итоговой Dashboard.<summary>
![alt text]()
![alt text]()
</details>
## Задание 4

1. Сохраните ваш Dashboard.Для этого перейдите в настройки Dashboard, выберите в боковом меню «JSON MODEL». Далее скопируйте отображаемое json-содержимое в отдельный файл и сохраните его.
2. В качестве решения задания приведите листинг этого файла.
[json model Dashboard]()
---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
