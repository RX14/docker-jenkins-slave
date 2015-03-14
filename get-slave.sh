#!/bin/bash
echo "Please enter the URL of your Jenkins instance (e.g. http://jenkins.example.com:8080/). Always include a trailing slash."
read JENKINS_URL

wget "${JENKINS_URL}jnlpJars/slave.jar" -O slave.jar
