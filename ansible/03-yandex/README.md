# Домашнее задание к занятию 3 «Использование Ansible».

## Подготовка к выполнению

1. Подготовьте в Yandex Cloud три хоста: для `clickhouse`, для `vector` и для `lighthouse`.
2. Репозиторий LightHouse находится [по ссылке](https://github.com/VKCOM/lighthouse).

## Основная часть

1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает LightHouse.

**Создание 3 ВМ в yandex.cloud**    

[vm](https://github.com/Kovrei/devops-netology/tree/main/ansible/03-yandex/vm)

```
ansible-vault encrypt_string --vault-id @prompt "token"
```

```
ansible-playbook --vault-id @prompt allVM.yml
```

**Playbook для создания lighthouse**  
[playboоk](https://github.com/Kovrei/devops-netology/tree/main/ansible/03-yandex/playbook)


2. При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`.

**Создана роль для lighthouse [role]()**  
[role](https://github.com/Kovrei/devops-netology/tree/main/ansible/03-yandex/playbook/roles/lighthouse)

3. Tasks должны: скачать статику LightHouse, установить Nginx или любой другой веб-сервер, настроить его конфиг для открытия LightHouse, запустить веб-сервер.

**Директория [tasks](https://github.com/Kovrei/devops-netology/tree/main/ansible/03-yandex/playbook/roles/lighthouse/tasks) включает в себя:
[main.yml](https://github.com/Kovrei/devops-netology/blob/main/ansible/03-yandex/playbook/roles/lighthouse/tasks/main.yml) 
[nginx.yml](https://github.com/Kovrei/devops-netology/blob/main/ansible/03-yandex/playbook/roles/lighthouse/tasks/nginx.yml) 
[lighthouse.yml](https://github.com/Kovrei/devops-netology/blob/main/ansible/03-yandex/playbook/roles/lighthouse/tasks/lighthouse.yml)**  

4. Подготовьте свой inventory-файл `prod.yml`.

**[prod.yml](https://github.com/Kovrei/devops-netology/blob/main/ansible/03-yandex/playbook/inventory/prod.yml)**

5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.

```
ansible-lint site.yml 
```
[site.yml](https://github.com/Kovrei/devops-netology/blob/main/ansible/03-yandex/playbook/site.yml)  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/03-yandex/img/3.5.JPG)  

6. Попробуйте запустить playbook на этом окружении с флагом `--check`.

```
ansible-playbook site.yml -i inventory/prod.yml --check
```

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/03-yandex/img/3.6.JPG)  

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.

```
ansible-playbook site.yml -i inventory/prod.yml --diff
```

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/03-yandex/img/3.7.JPG)  

8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.

```
ansible-playbook site.yml -i inventory/prod.yml --diff
```

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/03-yandex/img/3.8.JPG) 

**Результаты:**  
clickhouse
![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/03-yandex/img/clickhouse.JPG)  
vector  
![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/03-yandex/img/vector.JPG)
lighthouse  
![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/03-yandex/img/lighthouse.JPG)  

9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.
10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-03-yandex` на фиксирующий коммит, в ответ предоставьте ссылку на него.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
