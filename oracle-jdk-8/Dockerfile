FROM opensuse/leap:42.3 AS prepare

COPY dependencies/jdk-8u172-linux-x64.tar.gz /tmp/jdk.tar.gz

RUN set -x \
 && zypper -n in --name --no-recommends tar

RUN set -x \
 && mkdir /tmp/jdk \
 && tar -xzf /tmp/jdk.tar.gz --directory /tmp/jdk \
 && chown -R root:root /tmp/jdk

###############################################################################

FROM opensuse/leap:42.3

ENV TZ=Europe/Zurich

COPY --from=prepare /tmp/jdk /usr

RUN set -x \
 && ln -s /usr/jdk1.8.0_172/bin/java /usr/bin/java \
 && ln -s /usr/jdk1.8.0_172/bin/javac /usr/bin/javac \
 && echo $TZ > /etc/timezone

