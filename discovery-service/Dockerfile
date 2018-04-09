FROM openjdk:alpine

EXPOSE 8761

ADD ./target/discovery-service-0.0.1-SNAPSHOT.jar /discovery-service/
WORKDIR /discovery-service

CMD ["java", "-jar", "discovery-service-0.0.1-SNAPSHOT.jar"]
