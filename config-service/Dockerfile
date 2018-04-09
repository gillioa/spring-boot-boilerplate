FROM openjdk:alpine

EXPOSE 8888

ADD ./target/config-service-0.0.1-SNAPSHOT.jar /config-service/
ADD ./src/main/resources/application.yml /var/lib/config-service/
WORKDIR /config-service


CMD ["java", "-jar", "config-service-0.0.1-SNAPSHOT.jar", "--spring.config.location=file:/var/lib/config-service/application.yml"]
