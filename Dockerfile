
#Dockerfile
FROM tomcat:9.0.14-jre8-alpine
COPY ./target/*.jar /webapps/

EXPOSE 8080
CMD java -jar /webapps/*.jar
