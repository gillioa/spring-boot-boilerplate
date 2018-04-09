#/bin/bash

TOKEN_DEPLOY="deploy"
TOKEN_COMPILE="-c"
TOKEN_CLEAN="clean"
TOKEN_COMPILE_ONLY="compile"
TOKEN_IMAGES="images"

if [ "$SPRING_PROFILES_ACTIVE" == "" ]
then
    export SPRING_PROFILES_ACTIVE=docker
fi

if [ "$1" == "" ]
then
	echo -e "Usage:"
	echo -e "\t./dockerize.sh deploy -> to deploy the docker containers without recompiling all the jar file"
	echo -e "\t./dockerize.sh deploy -c -> to deploy the docker containers with the compilation of every jar file"
	echo -e "\t./dockerize.sh clean -> to stop and remove every docker containers and images created before"
	echo -e "\t./dockerize.sh compile -> to compile the jar files without deploying"
	echo -e "\t./dockerize.sh images -> create images with the jar files but don\'t compile the jar files"
	echo -e "\t./dockerize.sh images -c -> create images with the jar files and compile the jar files"
elif [ "$1" == $TOKEN_DEPLOY ] && [ "$2" == "" ]
then
	docker-compose build && docker-compose up
elif [ "$1" == $TOKEN_DEPLOY ] && [ "$2" == $TOKEN_COMPILE ]
then
	cd api-gateway && mvn package -DskipTests && cd .. && cd discovery-service && mvn package -DskipTests && cd .. && cd config-service && mvn package -DskipTests && cd .. && docker-compose build && docker-compose up
elif [ "$1" == $TOKEN_CLEAN ]
then
	docker rm discovery-service api-gateway watson-service config-service
	docker rmi discovery-service:latest api-gateway:latest watson-service:latest config-service:latest
elif [ "$1" == $TOKEN_COMPILE_ONLY ]
then
	cd api-gateway && mvn package -DskipTests && cd .. && cd discovery-service && mvn package -DskipTests && cd .. && cd config-service && mvn package -DskipTests && cd ..
elif [ "$1" == $TOKEN_IMAGES ] && [ "$2" == "" ]
then
	docker-compose build
elif [ "$1" == $TOKEN_IMAGES ] && [ "$2" == $TOKEN_COMPILE ]
then
	cd api-gateway && mvn package -DskipTests && cd .. && cd discovery-service && mvn package -DskipTests && cd .. && cd config-service && mvn package -DskipTests && cd .. && docker-compose build
fi