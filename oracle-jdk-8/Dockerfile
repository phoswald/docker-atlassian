FROM opensuse/leap:42.3 AS prepare

ADD dependencies/jdk-8u181-linux-x64.tar.gz /tmp/jdk

RUN set -x \
 && chown -R root:root /tmp/jdk

###############################################################################

FROM opensuse/leap:42.3

ENV TZ                Europe/Zurich
ENV LANG              de_CH.UTF-8
ENV LC_ALL            de_CH.UTF-8
ENV JAVA_TOOL_OPTIONS -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=2 -Dwho.am.i=Philip

COPY --from=prepare /tmp/jdk /usr

RUN set -x \
 && ln -s /usr/jdk1.8.0_181/bin/java /usr/bin/java \
 && ln -s /usr/jdk1.8.0_181/bin/javac /usr/bin/javac \
 && zypper -n install glibc-locale \
 && echo $TZ > /etc/timezone

