FROM opensuse/leap:42.3

ENV JAVA_HOME /usr/java/jre1.8.0_172-amd64

COPY dependencies/jre-8u172-linux-x64.rpm /tmp

RUN set -x \
 && zypper in --no-confirm --name --no-recommends which less nano curl tar \
 && rpm -i /tmp/jre-8u172-linux-x64.rpm \
 && rm /tmp/jre-8u172-linux-x64.rpm
