# Домашнее задание к занятию «Helm». Osipenkov AU

------

### Задание 1. Подготовить Helm-чарт для приложения

1. Необходимо упаковать приложение в чарт для деплоя в разные окружения. 

[chart](https://github.com/Kovrei/devops-netology/tree/main/kuber/helm/chart)

2. Каждый компонент приложения деплоится отдельным deployment’ом или statefulset’ом.

**deployment:**  

[multitool](https://github.com/Kovrei/devops-netology/blob/main/kuber/helm/chart/templates/deployment/d-multitool.yml)

[nginx](https://github.com/Kovrei/devops-netology/blob/main/kuber/helm/chart/templates/deployment/d-nginx.yml)

**service:**  

[multitool](https://github.com/Kovrei/devops-netology/blob/main/kuber/helm/chart/templates/service/svc-multitool.yml)

[nginx](https://github.com/Kovrei/devops-netology/blob/main/kuber/helm/chart/templates/service/svc-nginx.yml)

3. В переменных чарта измените образ приложения для изменения версии.

[values1 - nginx:1:26:0](https://github.com/Kovrei/devops-netology/blob/main/kuber/helm/chart/values1.yaml)

[values1 - nginx:1:27:0](https://github.com/Kovrei/devops-netology/blob/main/kuber/helm/chart/values2.yaml)

[values1 - nginx:1:28:0](https://github.com/Kovrei/devops-netology/blob/main/kuber/helm/chart/values3.yaml)

------
### Задание 2. Запустить две версии в разных неймспейсах

1. Подготовив чарт, необходимо его проверить. Запуститe несколько копий приложения.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/helm/img/2.1.1.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/helm/img/2.1.2.JPG)

2. Одну версию в namespace=app1, вторую версию в том же неймспейсе, третью версию в namespace=app2.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/helm/img/2.2.1.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/helm/img/2.2.2.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/helm/img/2.2.3.JPG)

3. Продемонстрируйте результат.



