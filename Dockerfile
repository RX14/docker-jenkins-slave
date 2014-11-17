FROM debian:wheezy

RUN apt-get update && apt-get install -y openjdk-7-jre-headless

#One of the only tools for jenkins that cannot be autoinstalled
RUN apt-get install -y git

RUN useradd -m -d /jenkins-slave/ jenkins
ADD slave.jar /
USER jenkins

MAINTAINER rx14
WORKDIR /jenkins-slave
ENTRYPOINT ["java", "-jar", "/slave.jar"]
