FROM debian:wheezy

RUN apt-get update && apt-get install -y openjdk-7-jre-headless

#Preinstalled tools
RUN apt-get install -y git wget

RUN useradd -m -d /jenkins-slave/ jenkins
ADD slave.jar /
USER jenkins

MAINTAINER rx14
WORKDIR /jenkins-slave
ENTRYPOINT ["java", "-jar", "/slave.jar"]
