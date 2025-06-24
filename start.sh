#!/bin/sh

# Запускаем service1 в фоне
cd /app/service1
node server.js &

# Запускаем service2 в фоне  
cd /app/service2
node server.js &

# Запускаем nginx
nginx -g "daemon off;"