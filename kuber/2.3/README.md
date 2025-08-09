# Домашнее задание к занятию «Конфигурация приложений». Osipenkov AU

------

### Задание 1. Создать Deployment приложения и решить возникшую проблему с помощью ConfigMap. Добавить веб-страницу

1. Создать Deployment приложения, состоящего из контейнеров nginx и multitool.

[Deployment](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/mission1/deploy.yml)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/img/1.1.JPG?raw=true)

2. Решить возникшую проблему с помощью ConfigMap.

[ConfigMap](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/mission1/cm-mt.yml)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/img/1.2.JPG?raw=true)

3. Продемонстрировать, что pod стартовал и оба конейнера работают.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/img/1.3.JPG?raw=true)

4. Сделать простую веб-страницу и подключить её к Nginx с помощью ConfigMap. Подключить Service и показать вывод curl или в браузере.

[ConfigMap](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/mission1/cm-nginx.yml)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/img/1.4.1.JPG?raw=true)

[Service](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/mission1/svc-nginx.yml)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/img/1.4.2.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/img/1.4.3.JPG?raw=true)

5. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

------

### Задание 2. Создать приложение с вашей веб-страницей, доступной по HTTPS 

1. Создать Deployment приложения, состоящего из Nginx.

[Deployment](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/mission2/deploy.yml)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/img/2.1.JPG?raw=true)

2. Создать собственную веб-страницу и подключить её как ConfigMap к приложению.

[ConfigMap](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/mission2/cm-nginx.yml)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/img/2.2.1JPG.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/img/2.2.2.JPG?raw=true)

3. Выпустить самоподписной сертификат SSL. Создать Secret для использования сертификата.

```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=aos-test.ru/O=aos-test.ru"
```

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/img/2.3.1.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/img/2.3.2.JPG?raw=true)

[Secret](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/mission2/sec-nginx.yml)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/img/2.3.3.JPG?raw=true)

4. Создать Ingress и необходимый Service, подключить к нему SSL в вид. Продемонстировать доступ к приложению по HTTPS. 

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/img/2.4.1.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/img/2.4.2.JPG?raw=true)

[Ingress]()

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/img/2.4.3.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/img/2.4.4.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/2.3/img/2.4.5.JPG?raw=true)

5. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

