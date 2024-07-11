#!/bin/bash

# Адрес сервера и порт
SERVER_IP="192.168.0.43"
PORT="80"

# Путь к файлу index.html
INDEX_HTML="/var/www/html/index.nginx-debian.html"

# Проверка доступности порта
nc -z $SERVER_IP $PORT > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "Порт $PORT недоступен на сервере $SERVER_IP"
  exit 1
fi

# Проверка существования index.html
if [ ! -f "$INDEX_HTML" ]; then
  echo "Файл index.html отсутствует на сервере $SERVER_IP"
  exit 1
fi

echo "Веб-сервер доступен!"
exit 0