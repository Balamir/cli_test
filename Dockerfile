FROM java:8-jre
MAINTAINER Abdullah Ceylan

WORKDIR /app
EXPOSE 8080
ENTRYPOINT java -jar hello-scala-assembly-1.1.jar

COPY hello-scala-assembly-1.1.jar /app/hello-scala-assembly-1.1.jar
