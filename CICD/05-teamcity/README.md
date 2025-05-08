# Домашнее задание к занятию 11 «Teamcity». Osipenkov A

## Подготовка к выполнению

1. В Yandex Cloud создайте новый инстанс (4CPU4RAM) на основе образа `jetbrains/teamcity-server`.
2. Дождитесь запуска teamcity, выполните первоначальную настройку.
3. Создайте ещё один инстанс (2CPU4RAM) на основе образа `jetbrains/teamcity-agent`. Пропишите к нему переменную окружения `SERVER_URL: "http://<teamcity_url>:8111"`.
4. Авторизуйте агент.
5. Сделайте fork [репозитория](https://github.com/aragastmatb/example-teamcity).
6. Создайте VM (2CPU4RAM) и запустите [playbook](./infrastructure).  
[VM](https://github.com/Kovrei/devops-netology/tree/main/CICD/05-teamcity/src)  
[playbook](https://github.com/Kovrei/devops-netology/tree/main/CICD/05-teamcity/playbook)  

## Основная часть

<details><summary>1. Создайте новый проект в teamcity на основе fork.</summary>
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.1.JPG?raw=true)
</details>

<details><summary>2. Сделайте autodetect конфигурации.</summary>
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.2.JPG)
</details>

3. Сохраните необходимые шаги, запустите первую сборку master.

<details><summary>4. Поменяйте условия сборки: если сборка по ветке `master`, то должен происходит `mvn clean deploy`, иначе `mvn clean test`.</summary>
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.4.1.JPG)
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.4.2.JPG)
</details>

<details><summary>5. Для deploy будет необходимо загрузить [settings.xml](./teamcity/settings.xml) в набор конфигураций maven у teamcity, предварительно записав туда креды для подключения к nexus.</summary>
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.5.1.JPG)
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.5.2.JPG)
</details>

<details><summary>6. В pom.xml необходимо поменять ссылки на репозиторий и nexus.</summary>
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.6.JPG)
</details>

<details><summary>7. Запустите сборку по master, убедитесь, что всё прошло успешно и артефакт появился в nexus.</summary>
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.7.JPG)
</details>

<details><summary>8. Мигрируйте `build configuration` в репозиторий.</summary>
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.8.JPG)
</details>

<details><summary>9. Создайте отдельную ветку `feature/add_reply` в репозитории.</summary>
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.9.JPG)
</details>

<details><summary>10. Напишите новый метод для класса Welcomer: метод должен возвращать произвольную реплику, содержащую слово `hunter`.</summary>
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.10.JPG)
</details>

<details><summary>11. Дополните тест для нового метода на поиск слова `hunter` в новой реплике.</summary>
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.11.JPG)
</details>

<details><summary>12. Сделайте push всех изменений в новую ветку репозитория.</summary>
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.12.JPG)
</details>

<details><summary>13. Убедитесь, что сборка самостоятельно запустилась, тесты прошли успешно.</summary>
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.13.JPG)
</details>

<details><summary>14. Внесите изменения из произвольной ветки `feature/add_reply` в `master` через `Merge`.</summary>
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.14.JPG)
</details>

<details><summary>15. Убедитесь, что нет собранного артефакта в сборке по ветке `master`.</summary>
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.15.JPG)
</details>

<details><summary>16. Настройте конфигурацию так, чтобы она собирала `.jar` в артефакты сборки.</summary>
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.16.JPG)
</details>

<details><summary>17. Проведите повторную сборку мастера, убедитесь, что сбора прошла успешно и артефакты собраны.</summary>
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.17.1.JPG)
![alt text](https://github.com/Kovrei/devops-netology/blob/main/CICD/05-teamcity/img/5.17.2.JPG)
</details>

18. Проверьте, что конфигурация в репозитории содержит все настройки конфигурации из teamcity.

19. В ответе пришлите ссылку на репозиторий.  
**[Example-teamcity](https://github.com/Kovrei/example-teamcity)**
