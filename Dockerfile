FROM alpine:3.2

RUN apk add --update git wget curl bash openjdk7-jre-base ca-certificates \
 && cd /tmp \
 && curl -o glibc-2.21-r2.apk "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk" \
 && apk add --allow-untrusted glibc-2.21-r2.apk \
 && curl -o glibc-bin-2.21-r2.apk "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-bin-2.21-r2.apk" \
 && apk add --allow-untrusted glibc-bin-2.21-r2.apk \
 && /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib \
 && rm -rf /tmp/* /var/cache/apk/* \
 && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
 && adduser -Dh /jenkins-slave/ -u 9001 jenkins && chown -R jenkins /jenkins-slave/

VOLUME /jenkins-slave/
USER jenkins
ADD slave.jar /

MAINTAINER rx14
WORKDIR /jenkins-slave/
ENTRYPOINT ["/usr/lib/jvm/java-1.7-openjdk/bin/java", "-Dfile.encoding=UTF-8", "-jar", "/slave.jar"]
