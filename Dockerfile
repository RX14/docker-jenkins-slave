FROM debian:wheezy

RUN apt-get update && apt-get install -y openjdk-7-jre-headless

#One of the only tools for jenkins that cannot be autoinstalled
RUN apt-get install -y git

ADD slave.jar /jenkins-slave/
RUN useradd -m -d /jenkins-slave/home/ jenkins
USER jenkins

MAINTAINER rx14
WORKDIR /jenkins-slave/home
VOLUME ["/jenkins-slave/home"]
ENTRYPOINT ["java", "-jar", "/jenkins-slave/slave.jar"]
