FROM debian:wheezy

RUN apt-get update && apt-get install -y openjdk-7-jre-headless

#One of the only tools for jenkins that cannot be autoinstalled
RUN apt-get install -y git

RUN useradd jenkins
RUN mkdir -p /jenkins-slave/root && chown -R jenkins /jenkins-slave/
USER jenkins

ADD slave.jar /jenkins-slave/

MAINTAINER rx14
WORKDIR /jenkins-slave/root
VOLUME ["/jenkins-slave/root"]
ENTRYPOINT ["java", "-jar", "/jenkins-slave/slave.jar", "-jar-cache", "/jenkins-slave/root/cache/"]
