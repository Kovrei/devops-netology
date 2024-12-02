#!/bin/bash

docker rmi schnitzler/mysqldump:latest

cd /opt/backup/
sudo chmod +x docker_mysqldump.sh

# Загрузка переменных окружения
source /opt/backup/secret.env

DB_HOST="db"
now=$(date +"%H:%M_%Y-%m-%d")

# Создание резервной копии
docker run --rm \
  --network shvirtd-example-python_backend \
  --env-file secret.env \
  schnitzler/mysqldump \
  -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" > "${now}_${MYSQL_DATABASE}"

# Удаление резервных копий старше 7 дней
find "$BACKUP_DIR" -type f -name "*.sql" -mtime +7 -exec rm {} \;
