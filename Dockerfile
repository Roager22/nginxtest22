# Multi-stage build для всех сервисов
FROM node:18-alpine as service-builder

# Копируем и собираем service1
WORKDIR /app/service1
COPY test-service-1/package*.json ./
RUN npm install --production
COPY test-service-1/server.js ./

# Копируем и собираем service2
WORKDIR /app/service2
COPY test-service-2/package*.json ./
RUN npm install --production
COPY test-service-2/server.js ./

# Финальный образ с nginx
FROM nginx:alpine

# Копируем конфигурацию nginx
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Устанавливаем Node.js для запуска сервисов
RUN apk add --no-cache nodejs npm

# Копируем сервисы
COPY --from=service-builder /app /app

# Копируем скрипт запуска
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80

CMD ["/start.sh"]