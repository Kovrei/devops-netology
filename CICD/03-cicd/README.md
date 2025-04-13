# Домашнее задание к занятию 9 «Процессы CI/CD». Osipenkov A

## Подготовка к выполнению

1. Создайте два VM в Yandex Cloud с параметрами: 2CPU 4RAM Centos7 (остальное по минимальным требованиям).

2. Пропишите в [inventory](./infrastructure/inventory/cicd/hosts.yml) [playbook](./infrastructure/site.yml) созданные хосты.

3. Добавьте в [files](./infrastructure/files/) файл со своим публичным ключом (id_rsa.pub). Если ключ называется иначе — найдите таску в плейбуке, которая использует id_rsa.pub имя, и исправьте на своё.

4. Запустите playbook, ожидайте успешного завершения.

5. Проверьте готовность SonarQube через [браузер](http://localhost:9000).

6. Зайдите под admin\admin, поменяйте пароль на свой.

7.  Проверьте готовность Nexus через [бразуер](http://localhost:8081).

8. Подключитесь под admin\admin123, поменяйте пароль, сохраните анонимный доступ.

## Знакомоство с SonarQube

### Основная часть

<details><summary>1. Создайте новый проект, название произвольное.</summary>  

manually
->
name
->
locally
->
token
</details>

<details><summary>2. Скачайте пакет sonar-scanner, который вам предлагает скачать SonarQube.</summary>  

other 
->
linux  
->
open adress offical documintation of the Scanner
->
wget -O sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-7.0.2.4839-linux-x64.zip?_gl=1*1bte3hq*_gcl_au*NzI0OTk2OTA4LjE3NDQ0Nzc3MjM.*_ga*MjA4MTE2OTk1MS4xNzQ0NDc3Njgz*_ga_9JZ0GZ5TC6*MTc0NDUxNjk0NS4yLjEuMTc0NDUxNjk4Mi41OS4wLjA.  
->
sudo unzip sonar-scanner.zip -d ~/opt 
</details> 

<details><summary>3. Сделайте так, чтобы binary был доступен через вызов в shell (или поменяйте переменную PATH, или любой другой, удобный вам способ).</summary>
 
 cd /opt/sonar-scanner-7.0.2.4839-linux-x64/bin  
 ->  
 export PATH=$(pwd):$PATH  
</details> 

<details><summary>4. Проверьте `sonar-scanner --version`.</summary> 
 sonar-scanner -v 
</details>

<details><summary>5. Запустите анализатор против кода из директории [example](./example) с дополнительным ключом `-Dsonar.coverage.exclusions=fail.py`.</summary> 
 
 cd ...../example  
 -> copy past
```
sonar-scanner \
  -Dsonar.projectKey=netology \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://89.169.142.216:9000 \
  -Dsonar.login=fa0a983ad17e17cfdd08c487e8e79b3359095a96 \
  -Dsonar.coverage.exclusions=fail.py  
```
</details>

6. Посмотрите результат в интерфейсе.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/03-cicd/img/3.6.JPG)

7. Исправьте ошибки, которые он выявил, включая warnings.

8. Запустите анализатор повторно — проверьте, что QG пройдены успешно.

9. Сделайте скриншот успешного прохождения анализа, приложите к решению ДЗ.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/03-cicd/img/3.9.JPG)

## Знакомство с Nexus

### Основная часть

<details><summary>1. В репозиторий `maven-public` загрузите артефакт с GAV-параметрами:</summary> 

 *    groupId: netology;
 *    artifactId: java;
 *    version: 8_282;
 *    classifier: distrib;
 *    type: tar.gz.

browser nexus  
->  
upload  
->  
maven-reales  
-> 
upload  
->  
browse  
->  
maven-public  
</details>

2. В него же загрузите такой же артефакт, но с version: 8_102.

3. Проверьте, что все файлы загрузились успешно.

4. В ответе пришлите файл `maven-metadata.xml` для этого артефекта.

[maven-metadata.xml](./mvn/maven-metadata.xml)  


### Знакомство с Maven

### Подготовка к выполнению

1. Скачайте дистрибутив с [maven](https://maven.apache.org/download.cgi).

2. Разархивируйте, сделайте так, чтобы binary был доступен через вызов в shell (или поменяйте переменную PATH, или любой другой, удобный вам способ).

3. Удалите из `apache-maven-<version>/conf/settings.xml` упоминание о правиле, отвергающем HTTP- соединение — раздел mirrors —> id: my-repository-http-unblocker.

4. Проверьте `mvn --version`.

5. Заберите директорию [mvn](./mvn) с pom.

### Основная часть

1. Поменяйте в `pom.xml` блок с зависимостями под ваш артефакт из первого пункта задания для Nexus (java с версией 8_282).

2. Запустите команду `mvn package` в директории с `pom.xml`, ожидайте успешного окончания.

3. Проверьте директорию `~/.m2/repository/`, найдите ваш артефакт.

![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/03-cicd/img/3.3.JPG)

<details><summary>4. В ответе пришлите исправленный файл `pom.xml`.</summary>

-> edit  
[pom.xml](./mvn/pom.xml)  
-> command  
mvn package  
-> new autocreate folder target. Build success
</details>

[pom.xml](./mvn/pom.xml) 

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
