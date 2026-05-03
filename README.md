# 🌸 Flower Shop E-Commerce Backend

![Java](https://img.shields.io/badge/Java-17+-blue)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.x-green)
![Spring Cloud](https://img.shields.io/badge/Spring_Cloud-Microservices-blue)
![Kafka](https://img.shields.io/badge/Apache_Kafka-Message_Broker-black)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-blue)
![Docker](https://img.shields.io/badge/Docker-Containers-blue)

A scalable backend system for an online flower shop, built on a robust microservices architecture. This project demonstrates the application of enterprise-level design patterns to solve real-world problems like high load, fault tolerance, and independent deployment scaling.

## 🎯 What Problems Does This Project Solve?

In classic monolithic e-commerce applications, peak traffic (e.g., on Valentine's Day or Mother's Day) can cause the entire site to crash if a single module (like the payment gateway) fails. This project addresses these architectural and business challenges:

1. **Fault Tolerance:** If the Delivery or Notification service goes down, customers can still browse the catalog and place orders without interruption.
2. **Event-Driven Architecture (Asynchronous Processing):** By utilizing **Apache Kafka**, order placement immediately returns a response to the user, while "heavy" tasks like sending emails and updating analytics are reliably processed in the background.
3. **Independent Scalability:** During sales events, specific high-load services like `Order Service` and `Catalog Service` can be scaled horizontally independently, saving server resources on less critical modules.
4. **Data Isolation:** Each microservice has its own dedicated database. This prevents database locks and allows choosing the most optimal storage solution for specific domain logic.
5. **Centralized Observability:** Distributed systems suffer from "monitoring blindness." This is solved by using the ELK Stack and Grafana for centralized logging and metrics collection.

---

## 🏗 Architecture

The system consists of independent microservices communicating via REST APIs (synchronous) and Apache Kafka (asynchronous event messaging).

### Infrastructure Services
* **API Gateway:** The single entry point for clients, handling request routing and JWT validation.
* **Eureka Server:** Service Discovery for dynamic registration and location of services.
* **Config Server:** Centralized configuration management.

### Business Microservices
* 🔐 **Auth Service:** User registration, authentication, and JWT generation.
* 👤 **User Service:** User profile and account management.
* 📋 **Catalog Service:** Product catalog, categories, and pricing management.
* 🛒 **Order Service:** Order processing and lifecycle management (publishes events to Kafka).
* 📦 **Inventory Service:** Stock control and reservation (prevents overbooking).
* 💳 **Payment Service:** Transaction processing (simulated acquiring).
* 🚚 **Delivery Service:** Logistics and courier status tracking.
* 📩 **Notification Service:** Asynchronous email/push notification delivery.
* 📊 **Analytics Service:** Business metrics collection and sales analytics.

---

## 🛠 Tech Stack

* **Core:** Java 17+, Spring Boot 3.x
* **Microservices:** Spring Cloud (Netflix Eureka, Spring Cloud Gateway, Config Server)
* **Security:** Spring Security, JWT (JSON Web Tokens)
* **Data Access & Storage:** Spring Data JPA, Hibernate, PostgreSQL
* **Caching:** Redis
* **Messaging (Message Broker):** Apache Kafka
* **Monitoring & Observability:** Prometheus, Grafana, ELK Stack (Elasticsearch, Logstash, Kibana)
* **DevOps:** Docker, Docker Compose

---

## 🚀 How to Run Locally

**1. Clone the repository**
```bash
git clone https://github.com/housemice/flowershop.git
cd flowershop
```

**2. Environment Configuration**
Copy the example environment file and set your secure secrets (especially `JWT_SECRET` and DB passwords):
```bash
cp .env.example .env
```

**3. Start the Infrastructure (DB, Message Broker, Cache)**
Make sure you have Docker installed. Spin up the required containers:
```bash
docker-compose up -d
```

**4. Start Spring Boot Services**
For the system to work correctly, start the services in the following strict order:
1. `Eureka Server` (wait for it to fully load)
2. `Config Server`
3. `API Gateway`
4. Business Microservices (the start order for business services doesn't matter).
