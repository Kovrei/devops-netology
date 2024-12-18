# Домашнее задание к занятию «Основы Terraform. Yandex Cloud». Осипенков АЮ

### Задание 1
В качестве ответа всегда полностью прикладывайте ваш terraform-код в git.
Убедитесь что ваша версия **Terraform** ~>1.8.4

1. Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.
2. Создайте сервисный аккаунт и ключ. [service_account_key_file](https://terraform-provider.yandexcloud.net).
   **[сервисный аккаунт создан через доп настройку terraform](https://github.com/Kovrei/devops-netology/tree/main/terraform/homework-02/service_account)**
3. Сгенерируйте новый или используйте свой текущий ssh-ключ. Запишите его открытую(public) часть в переменную **vms_ssh_public_root_key**.
4. Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.
  ![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.1.4.JPG)  
**При подключении возникли ошибки:**
**- В yandex_compute_instance.platform используется неизвестный platform_id "standart-v4" заменёно на "standard-v1";**
**- resources.memory 1gb заменено на 5gb;**
**- resources.cores 1 CPU заменено на 4 CPU.**
6. Подключитесь к консоли ВМ через ssh и выполните команду ``` curl ifconfig.me```.
Примечание: К OS ubuntu "out of a box, те из коробки" необходимо подключаться под пользователем ubuntu: ```"ssh ubuntu@vm_ip_address"```. Предварительно убедитесь, что ваш ключ добавлен в ssh-агент: ```eval $(ssh-agent) && ssh-add``` Вы познакомитесь с тем как при создании ВМ создать своего пользователя в блоке metadata в следующей лекции.;
  ![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.1.5.JPG)
7. Ответьте, как в процессе обучения могут пригодиться параметры ```preemptible = true``` и ```core_fraction=5``` в параметрах ВМ.  

**- preemtible определяет, прерываемость ВМ (внешний IP динамичный). Постоянно работающая ВМ стоит больше.**  
**- core_fraction – гарантированная доля vCPU, которая будет выделена ВМ. Соответственно, определяет производительность. Естественно, больше производительность – выше цена.**
**Данные опции следует учитывать для эффективной экономической составляющей.**

В качестве решения приложите:

- скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес;
- скриншот консоли, curl должен отобразить тот же внешний ip-адрес;
- ответы на вопросы.

### Задание 2

1. Замените все хардкод-**значения** для ресурсов **yandex_compute_image** и **yandex_compute_instance** на **отдельные** переменные. К названиям переменных ВМ добавьте в начало префикс **vm_web_** .  Пример: **vm_web_name**.
**[main.tf](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/src/main.tf)**
2. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их **default** прежними значениями из main.tf. 
![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.2.1.JPG)
3. Проверьте terraform plan. Изменений быть не должно. 
![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.2.2.JPG)

### Задание 3

1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
**[vms_platform.tf](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/src/vms_platform.tf)**
2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: **"netology-develop-platform-db"** ,  ```cores  = 2, memory = 2, core_fraction = 20```. Объявите её переменные с префиксом **vm_db_** в том же файле ('vms_platform.tf').  ВМ должна работать в зоне "ru-central1-b"
![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.3.3.JPG)
3. Примените изменения.
![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.3.1.JPG)
![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.3.2.JPG)

### Задание 4

1. Объявите в файле outputs.tf **один** output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном лично для вас формате.(без хардкода!!!)
**[outputs.tf](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/src/outputs.tf)**
2. Примените изменения.
В качестве решения приложите вывод значений ip-адресов команды ```terraform output```.
![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.4.JPG)

### Задание 5

1. В файле locals.tf опишите в **одном** local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.
![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.5.1.JPG)
2. Замените переменные внутри ресурса ВМ на созданные вами local-переменные.
![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.5.2.JPG)  
![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.5.3.JPG)
4. Примените изменения.
![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.5.4.JPG)


### Задание 6

1. Вместо использования трёх переменных  ".._cores",".._memory",".._core_fraction" в блоке  resources {...}, объедините их в единую map-переменную **vms_resources** и  внутри неё конфиги обеих ВМ в виде вложенного map(object).  
   ```
   пример из terraform.tfvars:
   vms_resources = {
     web={
       cores=2
       memory=2
       core_fraction=5
       hdd_size=10
       hdd_type="network-hdd"
       ...
     },
     db= {
       cores=2
       memory=4
       core_fraction=20
       hdd_size=10
       hdd_type="network-ssd"
       ...
     }
   }
   ```
    ![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.6.3.JPG)
3. Создайте и используйте отдельную map(object) переменную для блока metadata, она должна быть общая для всех ваших ВМ.
   ```
   пример из terraform.tfvars:
   metadata = {
     serial-port-enable = 1
     ssh-keys           = "ubuntu:ssh-ed25519 AAAAC..."
   }
   ```  
   ![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.6.4.JPG)
4. Найдите и закоментируйте все, более не используемые переменные проекта.
   ![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.6.1.JPG)
   ![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.6.2.JPG)
5. Проверьте terraform plan. Изменений быть не должно.
   ![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.6.5.JPG)

------

## Дополнительное задание (со звёздочкой*)

**Настоятельно рекомендуем выполнять все задания со звёздочкой.**   
Они помогут глубже разобраться в материале. Задания со звёздочкой дополнительные, не обязательные к выполнению и никак не повлияют на получение вами зачёта по этому домашнему заданию. 
-----
### Задание 7*

Изучите содержимое файла console.tf. Откройте terraform console, выполните следующие задания: 

1. Напишите, какой командой можно отобразить **второй** элемент списка test_list.  
```
local.test_list[1]
```
![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.7.1.JPG)
2. Найдите длину списка test_list с помощью функции length(<имя переменной>).  
```
length(join("",local.test_lists))
```
![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.7.2.JPG)
3. Напишите, какой командой можно отобразить значение ключа admin из map test_map.  
```
[for k,v in local.test_map : k if v == "John"]
```
![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.7.3.JPG)
4. Напишите interpolation-выражение, результатом которого будет: "John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks", используйте данные из переменных test_list, test_map, servers и функцию length() для подстановки значений.  
```
"${local.test_map.admin} is ${keys(local.test_map)[0]} for ${local.test_list[2]} server based on OS ${local.servers.production.image} with ${values(local.servers.production)[0]} vcpus, ${values(local.servers.production)[3]} ram, ${length(local.servers.production.disks)} virtual disks"
```
![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.7.4.JPG)
**Примечание**: если не догадаетесь как вычленить слово "admin", погуглите: "terraform get keys of map"

В качестве решения предоставьте необходимые команды и их вывод.

------

### Задание 8*
1. Напишите и проверьте переменную test и полное описание ее type в соответствии со значением из terraform.tfvars:
```
test = [
  {
    "dev1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
      "10.0.1.7",
    ]
  },
  {
    "dev2" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
      "10.0.2.29",
    ]
  },
  {
    "prod1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
      "10.0.1.30",
    ]
  },
]
```
![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.8.1.JPG)
2. Напишите выражение в terraform console, которое позволит вычленить строку "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117" из этой переменной.

```
var.test[0].dev1[0]
```
![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.8.2.JPG)
------

### Задание 9*

Используя инструкцию https://cloud.yandex.ru/ru/docs/vpc/operations/create-nat-gateway#tf_1, настройте для ваших ВМ nat_gateway. Для проверки уберите внешний IP адрес (nat=false) у ваших ВМ и проверьте доступ в интернет с ВМ, подключившись к ней через serial console. Для подключения предварительно через ssh измените пароль пользователя: ```sudo passwd ubuntu```

### Правила приёма работыДля подключения предварительно через ssh измените пароль пользователя: sudo passwd ubuntu
**[для удобства создана отдельная директория gateway с развертыванием ВМ](https://github.com/Kovrei/devops-netology/tree/main/terraform/homework-02/gateway)**  

![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.9.4.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.9.2.JPG)

![alt text](https://github.com/Kovrei/devops-netology/blob/main/terraform/homework-02/img/2.9.5.JPG)
