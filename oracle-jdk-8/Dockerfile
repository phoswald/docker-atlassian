FROM opensuse/leap:42.3

ENV TZ=Europe/Zurich

ADD --chown=root:root dependencies/jdk-8u172-linux-x64.tar.gz /usr

RUN set -x \
 && zypper -n in --name --no-recommends which less nano curl tar \
 && zypper -n clean -a \
 && ln -s /usr/jdk1.8.0_172/bin/java /usr/bin/java \
 && ln -s /usr/jdk1.8.0_172/bin/javac /usr/bin/javac \
 && echo $TZ > /etc/timezone

