FROM debian:wheezy

RUN apt-get update && apt-get install -y openjdk-7-jre-headless


RUN useradd jenkins
RUN mkdir -p /jenkins-slave/root && chown -R jenkins /jenkins-slave/
USER jenkins

ADD slave.jar /jenkins-slave/

MAINTAINER rx14
WORKDIR /jenkins-slave/root
VOLUME ["/jenkins-slave/root"]
ENTRYPOINT ["java", "-jar", "/jenkins-slave/slave.jar"]
