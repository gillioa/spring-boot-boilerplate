FROM openjdk:alpine

EXPOSE 8080

ADD ./target/api-gateway-0.0.1-SNAPSHOT.jar /api-gateway/
WORKDIR /api-gateway

CMD ["java", "-jar", "api-gateway-0.0.1-SNAPSHOT.jar"]
