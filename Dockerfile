
#Dockerfile
FROM tomcat:9.0.14-jre8-alpine
COPY ./target/simple-app-0.1-SNAPSHOT.jar /webapps/

EXPOSE 8080
CMD java -jar /webapps/simple-app-0.1-SNAPSHOT.jar
