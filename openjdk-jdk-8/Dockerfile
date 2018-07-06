FROM opensuse/leap:42.3

ENV TZ=Europe/Zurich

RUN set -x \
 && zypper -n in --name --no-recommends which less nano curl tar \
 && zypper -n in --name --no-recommends java-1_8_0-openjdk-devel \
 && echo $TZ > /etc/timezone

# Installs the following (no environment variables are set):
# - /usr/bin/java
# - /usr/bin/javac
# - /usr/lib64/jvm/java-1.8.0-openjdk-1.8.0/bin/java
# - /usr/lib64/jvm/java-1.8.0-openjdk-1.8.0/bin/javac
# - /usr/lib64/jvm/java-1.8.0-openjdk-1.8.0/jre/bin/java

