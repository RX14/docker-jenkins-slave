FROM debian:wheezy
MAINTAINER rx14

RUN apt-get update && apt-get install -y openjdk-7-jre-headless

ADD slave.jar /jenkins-slave/

RUN useradd jenkins
USER jenkins

RUN mkdir /jenkins-slave/root

WORKDIR /jenkins-slave/
VOLUME ["/jenkins-slave/root"]
ENTRYPOINT ["java", "-jar", "/jenkins-slave/slave.jar"]
