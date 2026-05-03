# 🌸 Flower Shop E-Commerce Backend

![Java](https://img.shields.io/badge/Java-17+-blue)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.x-green)
![Spring Cloud](https://img.shields.io/badge/Spring_Cloud-Microservices-blue)
![Kafka](https://img.shields.io/badge/Apache_Kafka-Message_Broker-black)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-blue)
![Docker](https://img.shields.io/badge/Docker-Containers-blue)

Масштабируемый backend для интернет-магазина цветов, построенный на базе микросервисной архитектуры. Проект демонстрирует применение enterprise-паттернов для решения проблем высоких нагрузок, отказоустойчивости и независимого развертывания.

## 🎯 Какие проблемы решает этот проект?

В классических монолитных интернет-магазинах при пиковых нагрузках (например, в праздники — 8 Марта или День святого Валентина) отказ одного модуля (например, платежного шлюза) приводит к падению всего сайта. Этот проект решает архитектурные и бизнесовые проблемы:

1. **Отказоустойчивость (Fault Tolerance):** Ошибка в сервисе доставки или уведомлений не мешает клиентам просматривать каталог и оформлять заказы.
2. **Асинхронное взаимодействие (Event-Driven Architecture):** Использование **Apache Kafka**. Оформление заказа моментально возвращает ответ пользователю, а "тяжелые" задачи (уведомления, аналитика) надежно обрабатываются в фоне.
3. **Независимое масштабирование:** В дни распродаж можно увеличить количество инстансов только для `Order Service` и `Catalog Service`, экономя серверные ресурсы на остальных модулях.
4. **Изоляция данных:** У каждого сервиса своя база данных. Это предотвращает блокировки и позволяет выбрать оптимальное хранилище под конкретную задачу.
5. **Централизованный мониторинг:** Решена проблема "слепоты" в распределенных системах с помощью ELK Stack и Grafana.

---

## 🏗 Архитектура

Проект состоит из набора независимых микросервисов, общающихся через REST API (синхронно) и брокер сообщений Kafka (асинхронно).

### Инфраструктурные сервисы
* **API Gateway:** Единая точка входа, маршрутизация запросов, валидация JWT токенов.
* **Eureka Server:** Service Discovery (регистрация и динамическое обнаружение сервисов).
* **Config Server:** Централизованное хранение конфигураций.

### Бизнес-микросервисы
* 🔐 **Auth Service:** Регистрация, авторизация и генерация JWT-токенов.
* 👤 **User Service:** Управление профилями пользователей.
* 📋 **Catalog Service:** Управление товарами, категориями и ценами.
* 🛒 **Order Service:** Формирование и обработка заказов (публикует события в Kafka).
* 📦 **Inventory Service:** Контроль остатков на складе (предотвращение овербукинга).
* 💳 **Payment Service:** Обработка транзакций (имитация эквайринга).
* 🚚 **Delivery Service:** Логистика, статусы доставки курьерами.
* 📩 **Notification Service:** Асинхронная отправка email/push уведомлений пользователям.
* 📊 **Analytics Service:** Сбор бизнес-метрик и аналитика продаж.

---

## 🛠 Технологический стек

* **Core:** Java 17+, Spring Boot 3.x
* **Microservices:** Spring Cloud (Netflix Eureka, Spring Cloud Gateway, Config Server)
* **Security:** Spring Security, JWT (JSON Web Tokens)
* **Data Access & Storage:** Spring Data JPA, Hibernate, PostgreSQL
* **Caching:** Redis
* **Messaging (Message Broker):** Apache Kafka
* **Monitoring & Observability:** Prometheus, Grafana, ELK Stack (Elasticsearch, Logstash, Kibana)
* **DevOps:** Docker, Docker Compose

---

## 🚀 Как запустить локально

**1. Клонирование репозитория**
```bash
git clone https://github.com/housemice/flowershop.git
cd flowershop
```

**2. Настройка окружения**
Скопируйте пример файла с переменными окружения и задайте свои секреты (в первую очередь `JWT_SECRET` и пароли к базам данных):
```bash
cp .env.example .env
```

**3. Запуск инфраструктуры (БД, Брокер сообщений, Кэш)**
Убедитесь, что у вас установлен Docker. Запустите необходимые контейнеры:
```bash
docker-compose up -d
```

**4. Запуск Spring Boot сервисов**
Для корректной работы сервисы необходимо запускать в строгом порядке:
1. `Eureka Server` (дождаться полной загрузки)
2. `Config Server`
3. `API Gateway`
4. Бизнес-микросервисы (порядок запуска бизнес-сервисов не имеет значения).
