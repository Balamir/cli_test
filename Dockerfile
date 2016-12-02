FROM java:8-jre
MAINTAINER Abdullah Ceylan

WORKDIR /app
EXPOSE 8080
ENTRYPOINT java -jar hello-scala-assembly-1.1.jar

COPY /var/lib/jenkins/workspace/dasdasd/target/scala-2.11/hello-scala-assembly-1.1.jar 
