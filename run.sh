#!/bin/bash
chown -R jenkins:jenkins /jenkins-slave/

COMMAND="java -jar /slave.jar "$@""
su - jenkins -c "$COMMAND"
