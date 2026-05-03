#!/bin/bash
set -e

echo "Начинаем создание структуры проекта..."

mkdir -p flower-shop
cd flower-shop

# API Gateway
mkdir -p api-gateway/src/main/java/com/flowershop/gateway/{controller,filter,security,config,exception/handler}
mkdir -p api-gateway/src/main/resources
mkdir -p api-gateway/src/test/java/com/flowershop/gateway
touch api-gateway/src/main/java/com/flowershop/gateway/ApiGatewayApplication.java
touch api-gateway/src/main/resources/application.yml
touch api-gateway/pom.xml

# Eureka Server
mkdir -p eureka-server/src/main/java/com/flowershop/eureka
mkdir -p eureka-server/src/main/resources
mkdir -p eureka-server/src/test/java/com/flowershop/eureka
touch eureka-server/src/main/java/com/flowershop/eureka/EurekaServerApplication.java
touch eureka-server/src/main/resources/application.yml
touch eureka-server/pom.xml

# Config Server
mkdir -p config-server/src/main/java/com/flowershop/configserver
mkdir -p config-server/src/main/resources/configs
mkdir -p config-server/src/test/java/com/flowershop/configserver
touch config-server/src/main/java/com/flowershop/configserver/ConfigServerApplication.java
touch config-server/src/main/resources/application.yml
touch config-server/src/main/resources/configs/{auth,user,order,catalog,payment,inventory,delivery,notification,analytics}-service.yml
touch config-server/pom.xml

# Common Lib
mkdir -p common-lib/src/main/java/com/flowershop/common/{dto/request,dto/response,events,exceptions,utils,constants}
mkdir -p common-lib/src/test/java/com/flowershop/common
touch common-lib/src/main/java/com/flowershop/common/events/{OrderCreated,PaymentSuccess,PaymentFailed,InventoryUpdated,DeliveryStatus,Notification}Event.java
touch common-lib/src/main/java/com/flowershop/common/exceptions/{ResourceNotFound,Business,Validation}Exception.java
touch common-lib/src/main/java/com/flowershop/common/utils/{DateUtils,JsonUtils}.java
touch common-lib/src/main/java/com/flowershop/common/constants/KafkaTopics.java
touch common-lib/pom.xml

# Auth Service
mkdir -p auth-service/src/main/java/com/flowershop/authservice/{controller,service/impl,repository,entity,dto/request,dto/response,mapper,exception/handler,config,security/jwt,security/filter}
mkdir -p auth-service/src/main/resources/db/migration
mkdir -p auth-service/src/test/java/com/flowershop/authservice/{controller,service}
touch auth-service/src/main/java/com/flowershop/authservice/AuthServiceApplication.java
touch auth-service/src/main/java/com/flowershop/authservice/controller/{AuthController,TokenController}.java
touch auth-service/src/main/java/com/flowershop/authservice/service/{AuthService,TokenService}.java
touch auth-service/src/main/java/com/flowershop/authservice/service/impl/{AuthServiceImpl,TokenServiceImpl}.java
touch auth-service/src/main/java/com/flowershop/authservice/repository/{UserRepository,TokenRepository}.java
touch auth-service/src/main/java/com/flowershop/authservice/entity/{User,Token}.java
touch auth-service/src/main/java/com/flowershop/authservice/dto/request/{LoginRequest,RegisterRequest,RefreshTokenRequest}.java
touch auth-service/src/main/java/com/flowershop/authservice/dto/response/{AuthResponse,TokenResponse}.java
touch auth-service/src/main/java/com/flowershop/authservice/mapper/UserMapper.java
touch auth-service/src/main/java/com/flowershop/authservice/exception/{InvalidTokenException,UserAlreadyExistsException}.java
touch auth-service/src/main/java/com/flowershop/authservice/exception/handler/GlobalExceptionHandler.java
touch auth-service/src/main/java/com/flowershop/authservice/config/{SecurityConfig,RedisConfig}.java
touch auth-service/src/main/java/com/flowershop/authservice/security/jwt/{JwtProvider,JwtValidator}.java
touch auth-service/src/main/java/com/flowershop/authservice/security/filter/JwtAuthFilter.java
touch auth-service/src/main/resources/application.yml
touch auth-service/pom.xml

# User Service
mkdir -p user-service/src/main/java/com/flowershop/userservice/{controller,service/impl,repository,entity,dto/request,dto/response,mapper,exception/handler,config}
mkdir -p user-service/src/main/resources/db/migration
mkdir -p user-service/src/test/java/com/flowershop/userservice/{controller,service}
touch user-service/src/main/java/com/flowershop/userservice/UserServiceApplication.java
touch user-service/src/main/java/com/flowershop/userservice/controller/UserController.java
touch user-service/src/main/java/com/flowershop/userservice/service/UserService.java
touch user-service/src/main/java/com/flowershop/userservice/service/impl/UserServiceImpl.java
touch user-service/src/main/java/com/flowershop/userservice/repository/UserProfileRepository.java
touch user-service/src/main/java/com/flowershop/userservice/entity/UserProfile.java
touch user-service/src/main/java/com/flowershop/userservice/dto/request/{CreateUserRequest,UpdateUserRequest}.java
touch user-service/src/main/java/com/flowershop/userservice/dto/response/UserResponse.java
touch user-service/src/main/java/com/flowershop/userservice/mapper/UserProfileMapper.java
touch user-service/src/main/java/com/flowershop/userservice/exception/UserNotFoundException.java
touch user-service/src/main/java/com/flowershop/userservice/exception/handler/GlobalExceptionHandler.java
touch user-service/src/main/java/com/flowershop/userservice/config/DatabaseConfig.java
touch user-service/src/main/resources/application.yml
touch user-service/pom.xml

# Catalog Service
mkdir -p catalog-service/src/main/java/com/flowershop/catalogservice/{controller,service/impl,repository,entity,dto/request,dto/response,mapper,exception/handler,config}
mkdir -p catalog-service/src/main/resources/db/migration
mkdir -p catalog-service/src/test/java/com/flowershop/catalogservice/{controller,service}
touch catalog-service/src/main/java/com/flowershop/catalogservice/CatalogServiceApplication.java
touch catalog-service/src/main/java/com/flowershop/catalogservice/controller/{Flower,Bouquet,Category}Controller.java
touch catalog-service/src/main/java/com/flowershop/catalogservice/service/{Flower,Bouquet,Category}Service.java
touch catalog-service/src/main/java/com/flowershop/catalogservice/service/impl/{Flower,Bouquet,Category}ServiceImpl.java
touch catalog-service/src/main/java/com/flowershop/catalogservice/repository/{Flower,Bouquet,Category}Repository.java
touch catalog-service/src/main/java/com/flowershop/catalogservice/entity/{Flower,Bouquet,Category}.java
touch catalog-service/src/main/java/com/flowershop/catalogservice/dto/request/{CreateFlowerRequest,UpdateFlowerRequest,CreateBouquetRequest}.java
touch catalog-service/src/main/java/com/flowershop/catalogservice/dto/response/{Flower,Bouquet,Category}Response.java
touch catalog-service/src/main/java/com/flowershop/catalogservice/mapper/{Flower,Bouquet,Category}Mapper.java
touch catalog-service/src/main/java/com/flowershop/catalogservice/exception/FlowerNotFoundException.java
touch catalog-service/src/main/java/com/flowershop/catalogservice/exception/handler/GlobalExceptionHandler.java
touch catalog-service/src/main/java/com/flowershop/catalogservice/config/{RedisConfig,DatabaseConfig}.java
touch catalog-service/src/main/resources/application.yml
touch catalog-service/pom.xml

# Order Service
mkdir -p order-service/src/main/java/com/flowershop/orderservice/{controller,service/impl,repository,entity,dto/request,dto/response,mapper,exception/handler,config,event/producer}
mkdir -p order-service/src/main/resources/db/migration
mkdir -p order-service/src/test/java/com/flowershop/orderservice/{controller,service}
touch order-service/src/main/java/com/flowershop/orderservice/OrderServiceApplication.java
touch order-service/src/main/java/com/flowershop/orderservice/controller/OrderController.java
touch order-service/src/main/java/com/flowershop/orderservice/service/OrderService.java
touch order-service/src/main/java/com/flowershop/orderservice/service/impl/OrderServiceImpl.java
touch order-service/src/main/java/com/flowershop/orderservice/repository/{Order,OrderItem}Repository.java
touch order-service/src/main/java/com/flowershop/orderservice/entity/{Order,OrderItem}.java
touch order-service/src/main/java/com/flowershop/orderservice/dto/request/{CreateOrderRequest,UpdateOrderRequest}.java
touch order-service/src/main/java/com/flowershop/orderservice/dto/response/{Order,OrderItem}Response.java
touch order-service/src/main/java/com/flowershop/orderservice/mapper/OrderMapper.java
touch order-service/src/main/java/com/flowershop/orderservice/exception/OrderNotFoundException.java
touch order-service/src/main/java/com/flowershop/orderservice/exception/handler/GlobalExceptionHandler.java
touch order-service/src/main/java/com/flowershop/orderservice/config/{KafkaConfig,DatabaseConfig}.java
touch order-service/src/main/java/com/flowershop/orderservice/event/producer/OrderEventProducer.java
touch order-service/src/main/resources/application.yml
touch order-service/pom.xml

# Monitoring & Docker
mkdir -p monitoring/{prometheus,grafana/dashboards,elk}
mkdir -p docker
touch monitoring/prometheus/prometheus.yml
touch monitoring/grafana/dashboards/{services-dashboard,kafka-dashboard}.json
touch monitoring/elk/logstash.conf
touch docker/Dockerfile.gateway
touch docker-compose.yml
touch pom.xml
touch .gitignore
touch README.md

echo "✅ Готово! Структура успешно создана."
