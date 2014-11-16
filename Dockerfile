FROM ubuntu:14.04

RUN apt-get update && apt-get install -y openjdk-7-jre-headless

ADD slave.jar /jenkins-slave/
WORKDIR /jenkins-slave/
RUN mkdir root

ENTRYPOINT ["java", "-jar", "/jenkins-slave/slave.jar"]
