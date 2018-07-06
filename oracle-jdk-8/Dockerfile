FROM opensuse/leap:42.3

ENV TZ=Europe/Zurich

COPY dependencies/jdk-8u172-linux-x64.rpm /tmp

RUN set -x \
 && zypper -n in --name --no-recommends which less nano curl tar \
 && rpm -i /tmp/jdk-8u172-linux-x64.rpm \
 && rm /tmp/jdk-8u172-linux-x64.rpm \
 && echo $TZ > /etc/timezone

# Installs the following (no environment variables are set):
# - /usr/bin/java
# - /usr/bin/javac
# - /usr/java/jdk1.8.0_172-amd64/bin/java
# - /usr/java/jdk1.8.0_172-amd64/bin/javac
# - /usr/java/jdk1.8.0_172-amd64/jre/bin/java

