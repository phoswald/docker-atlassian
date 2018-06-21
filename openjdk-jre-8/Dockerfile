FROM opensuse/leap:42.3

ENV JAVA_HOME /usr/lib64/jvm/java-1.8.0-openjdk-1.8.0/jre

RUN set -x \
 && zypper in --no-confirm --name --no-recommends which less nano curl tar \
 && zypper in --no-confirm --name --no-recommends java-1_8_0-openjdk-headless \
 && echo "Europe/Zurich" > /etc/timezone
