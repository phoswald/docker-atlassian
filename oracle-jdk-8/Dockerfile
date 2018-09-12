FROM opensuse/leap:42.3 AS prepare

COPY dependencies/jdk-8u181-linux-x64.tar.gz /tmp/jdk.tar.gz

RUN set -x \
 && zypper -n in --name --no-recommends tar

RUN set -x \
 && mkdir /tmp/jdk \
 && tar -xzf /tmp/jdk.tar.gz --directory /tmp/jdk \
 && chown -R root:root /tmp/jdk

###############################################################################

FROM opensuse/leap:42.3

ENV TZ                Europe/Zurich
ENV LANG              de_CH.UTF-8
ENV LC_ALL            de_CH.UTF-8
ENV JAVA_TOOL_OPTIONS -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=2

COPY --from=prepare /tmp/jdk /usr

RUN set -x \
 && ln -s /usr/jdk1.8.0_181/bin/java /usr/bin/java \
 && ln -s /usr/jdk1.8.0_181/bin/javac /usr/bin/javac \
 && zypper -n install glibc-locale \
 && echo $TZ > /etc/timezone

