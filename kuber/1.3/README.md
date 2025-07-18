# Домашнее задание к занятию «Запуск приложений в K8S». Osipemkov AU

### Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod

1. Создать Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Решить возникшую ошибку.

```
kubectl describe pod netology-7768bc969c-rr4wq
kubectl logs netology-7768bc969c-rr4wq --all-containers=true
kubectl events
kubectl describe deployment netology
```
![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.3/img/1.1.1.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.3/img/1.1.2.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.3/img/1.1.3.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.3/img/1.1.4.JPG?raw=true)

2. После запуска увеличить количество реплик работающего приложения до 2.

[deployment1](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.3/pod/deployment1.yml)

3. Продемонстрировать количество подов до и после масштабирования.

**до**  
![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.3/img/1.1.5.JPG?raw=true)

**после**  
![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.3/img/1.2.JPG?raw=true)

4. Создать Service, который обеспечит доступ до реплик приложений из п.1.

[netology-svc](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.3/svc/netology-svc.yml)  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.3/img/1.4.JPG?raw=true)

5. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложений из п.1.

[Pod](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.3/pod/pod.yml)  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.3/img/1.5.1.JPG?raw=true)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.3/img/1.5.2.JPG?raw=true)

------

### Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

1. Создать Deployment приложения nginx и обеспечить старт контейнера только после того, как будет запущен сервис этого приложения.

[Deployment2](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.3/pod/deployment2.yml)

2. Убедиться, что nginx не стартует. В качестве Init-контейнера взять busybox.
3. Создать и запустить Service. Убедиться, что Init запустился.

[nginx-svc](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.3/svc/nginx-svc.yml)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.3/img/2.3.JPG?raw=true)

4. Продемонстрировать состояние пода до и после запуска сервиса.

**до**  
![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.3/img/2.1.1.JPG?raw=true)

**после**  
![alt text](https://github.com/Kovrei/devops-netology/blob/main/kuber/1.3/img/2.1.2.JPG?raw=true)

------


