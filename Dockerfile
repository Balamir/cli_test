FROM java:8-jre
MAINTAINER Abdullah Ceylan

EXPOSE 8080
ENTRYPOINT java -jar hello-scala-assembly-1.1.jar

ADD /var/lib/jenkins/workspace/pipeline/target/scala-2.11/hello-scala-assembly-1.1.jar 
