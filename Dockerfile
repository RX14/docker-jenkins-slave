FROM ubuntu:14.04

RUN apt-get update && apt-get install python-software-properties
RUN add-apt-repository ppa:webupd8team/java

# BY UNCOMMENTING THE LINE BELOW YOU ACCEPT THE ORACLE LICENCE FOR JDK8
#echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN apt-get install oracle-java8-installer oracle-java8-set-default

ADD slave.jar /jenkins-slave/
WORKDIR /jenkins-slave/
RUN mkdir root

ENTRYPOINT ["java", "-jar", "/jenkins-slave/slave.jar"]
