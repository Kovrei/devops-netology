# Домашнее задание к занятию 1 «Введение в Ansible». Осипенков АЮ

## Подготовка к выполнению

1. Установите Ansible версии 2.10 или выше.
2. Создайте свой публичный репозиторий на GitHub с произвольным именем.
3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.

## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.1.JPG)

2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.2.JPG)

3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.3.JPG)  

Dockerfile:
```
FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    python3.8 \
    python3-pip
```
Команды:
```
docker build -t vm1/ubuntu:v1
docker run -d -t --name vm1/ubuntu:v1
docker run -d -t --name centos7 centos:7

```
4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.4.JPG?raw=true)

5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.  

[deb](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/playbook/group_vars/deb/examp.yml)

[el](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/playbook/group_vars/el/examp.yml)

6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.6.JPG?raw=true)

7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.7.JPG?raw=true)

8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.8.JPG?raw=true)

9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.9.1.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.9.2.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.9.3.JPG?raw=true)

10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.   

[local](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/playbook/inventory/prod.yml)

11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.   

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.10.JPG?raw=true)

12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.  
13. Предоставьте скриншоты результатов запуска команд.

## Необязательная часть

1. При помощи `ansible-vault` расшифруйте все зашифрованные файлы с переменными.  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.11.JPG?raw=true)

2. Зашифруйте отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавьте полученное значение в `group_vars/all/exmp.yml`.  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.12.1.JPG?raw=true)

[копирование в all/examp.yml](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/playbook/group_vars/all/examp.yml)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.12.2.JPG?raw=true)

3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.13.JPG?raw=true)

4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную. В качестве образа можно использовать [этот вариант](https://hub.docker.com/r/pycontribs/fedora).  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.14.1.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.14.2.JPG?raw=true)

5. Напишите скрипт на bash: автоматизируйте поднятие необходимых контейнеров, запуск ansible-playbook и остановку контейнеров.  

[скрипт](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/scrypt.sh)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.15.1.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/ansible/01-base/img/1.15.2.JPG?raw=true)

6. Все изменения должны быть зафиксированы и отправлены в ваш личный репозиторий.
---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
