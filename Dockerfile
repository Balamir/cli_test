FROM java:8-jre
MAINTAINER Abdullah Ceylan

WORKDIR /app
EXPOSE 8080
ENTRYPOINT java -jar hello-scala-assembly-1.1.jar

ADD http://52.211.200.126:8080/job/pipeline/lastSuccessfulBuild/artifact/target/scala-2.11/hello-scala-assembly-1.1.jar /app/hello-scala-assembly-1.1.jar
