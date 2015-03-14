FROM jeanblanchard/busybox-java:8

RUN opkg-install curl wget git

RUN adduser -Dh /jenkins-slave/ -u 9001 jenkins && chown -R jenkins /jenkins-slave/
VOLUME /jenkins-slave/
USER jenkins
ADD slave.jar /

MAINTAINER rx14
WORKDIR /jenkins-slave/
ENTRYPOINT ["/opt/jdk/bin/java", "-Dfile.encoding=UTF-8", "-jar", "/slave.jar"]
