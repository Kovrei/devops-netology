# Домашнее задание к занятию 10 «Jenkins». Osipenkov AU

## Подготовка к выполнению

1. Создать два VM: для jenkins-master и jenkins-agent.
2. Установить Jenkins при помощи playbook.
3. Запустить и проверить работоспособность.
4. Сделать первоначальную настройку.

## Основная часть

<details><summary>1. Сделать Freestyle Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.</summary>
![alt text]()
</details>

<details><summary>2. Сделать Declarative Pipeline Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.</summary>
![alt text]()
</details>

<details><summary>3. Перенести Declarative Pipeline в репозиторий в файл `Jenkinsfile`.</summary>
![alt text]()
</details>

<details><summary>4. Создать Multibranch Pipeline на запуск `Jenkinsfile` из репозитория.</summary>
![alt text]()
</details>

<details><summary>5. Создать Scripted Pipeline, наполнить его скриптом из [pipeline](./pipeline).</summary>
![alt text]()
</details>

<details><summary>6. Внести необходимые изменения, чтобы Pipeline запускал `ansible-playbook` без флагов `--check --diff`, если не установлен параметр при запуске джобы (prod_run = True). По умолчанию параметр имеет значение False и запускает прогон с флагами `--check --diff`.</summary>
![alt text]()
</details>

<details><summary>7. Проверить работоспособность, исправить ошибки, исправленный Pipeline вложить в репозиторий в файл `ScriptedJenkinsfile`.</summary>
![alt text]()
</details>

<details><summary>8. Отправить ссылку на репозиторий с ролью и Declarative Pipeline и Scripted Pipeline.</summary>
![alt text]()
</details>

<details><summary>9. Сопроводите процесс настройки скриншотами для каждого пункта задания!!</summary>
![alt text]()
</details>

## Необязательная часть

<details><summary>1. Создать скрипт на groovy, который будет собирать все Job, завершившиеся хотя бы раз неуспешно. Добавить скрипт в репозиторий с решением и названием `AllJobFailure.groovy`.</summary>
![alt text]()
</details>

<details><summary>2. Создать Scripted Pipeline так, чтобы он мог сначала запустить через Yandex Cloud CLI необходимое количество инстансов, прописать их в инвентори плейбука и после этого запускать плейбук. Мы должны при нажатии кнопки получить готовую к использованию систему.</summary>
![alt text]()
</details>

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
