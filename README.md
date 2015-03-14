docker-jenkins-slave
====================

This is a very minimal docker image with the very minimum of tools. Because of this, all build tools
should be installed via jenkins tool installers on master.


Usage
-----
1. Run `get-slave.sh` to download the jenkins `slave.jar` to the current directory.
2. `docker build -t jenkins-slave .`
3. **OPTIONAL:** Create a directory on the filesystem to keep the jenkins slave working directory in. This allows you to not redownload the JDK, gradle, maven etc. when the container reboots.
  1. Create the slave persist directory
  2. `chown -R 9001 <slave persist directory>` as root
3. Create a new dumb slave in the Jenkins web gui with the following options:
  - Remote root directory: `/jenkins-slave/`
  - Launch method: `Launch slave agents via Java Web Start`
4. Copy `jnlpUrl` and `secret` from `Run from slave command line`
5. `docker create --name jenkins-slave -v <slave persist directory>:/jenkins-slave/ jenkins-slave -jnlpUrl <jnlpURL> -secret <secret>`
6. `docker run jenkins-slave`
