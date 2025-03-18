# Домашнее задание к занятию 2 «Работа с Playbook». Осипенков АЮ

## Подготовка к выполнению

1. * Необязательно. Изучите, что такое [ClickHouse](https://www.youtube.com/watch?v=fjTNS2zkeBs) и [Vector](https://www.youtube.com/watch?v=CgEhyffisLY).
2. Создайте свой публичный репозиторий на GitHub с произвольным именем или используйте старый.
3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.
4. Подготовьте хосты в соответствии с группами из предподготовленного playbook.

## Основная часть

1. Подготовьте свой inventory-файл `prod.yml`. 
[my_prod.yml](https://github.com/Kovrei/devops-netology/blob/main/ansible/02-playbook/playbook/inventory/prod.yml)
2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev). Конфигурация vector должна деплоиться через template файл jinja2. От вас не требуется использовать все возможности шаблонизатора, просто вставьте стандартный конфиг в template файл. Информация по шаблонам по [ссылке](https://www.dmosk.ru/instruktions.php?object=ansible-nginx-install). не забудьте сделать handler на перезапуск vector в случае изменения конфигурации!  

[my_role_vector](https://github.com/Kovrei/devops-netology/tree/main/ansible/02-playbook/playbook/roles/vector)  
[my_template](https://github.com/Kovrei/devops-netology/blob/main/ansible/02-playbook/playbook/roles/vector/tamplates/config.j2)  
[my_handler](https://github.com/Kovrei/devops-netology/blob/main/ansible/02-playbook/playbook/roles/vector/handlers/main.yml)  
  
3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.  
4. Tasks должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию, установить vector.  

[my_tasks](https://github.com/Kovrei/devops-netology/blob/main/ansible/02-playbook/playbook/roles/vector/tasks/vector.yml)

5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.   
```
ansible-playbook site.yml
```
Первый раз выходит ошибка.  
![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/02-playbook/img/2.5.1.vector_error.JPG?raw=true)
Повторный запуск устраняет ее. 
![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/02-playbook/img/2.5.2.vector_on.JPG?raw=true)

6. Попробуйте запустить playbook на этом окружении с флагом `--check`.

```
ansible-playbook site.yml --check
```

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/02-playbook/img/2.6.JPG?raw=true)

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.

```
ansible-playbook site.yml --diff
```
![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/02-playbook/img/2.7.JPG?raw=true)

8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.

```
ansible-playbook site.yml --diff
```
![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/02-playbook/img/2.8.JPG?raw=true)

9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги. Пример качественной документации ansible playbook по [ссылке](https://github.com/opensearch-project/ansible-playbook). Так же приложите скриншоты выполнения заданий №5-8
10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-02-playbook` на фиксирующий коммит, в ответ предоставьте ссылку на него.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
