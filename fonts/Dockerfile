FROM opensuse/leap:42.3

RUN zypper -n install curl cabextract font-util fontconfig





#RUN zypper -n install curl cabextract fontconfig

#COPY dependencies/xorg-x11-font-utils-7.5-21.el7.x86_64.rpm  /tmp
#RUN rpm -i tmp/xorg-x11-font-utils-7.5-21.el7.x86_64.rpm

COPY dependencies/msttcore-fonts-installer-2.6-1.noarch.rpm /tmp
#RUN rpm -i tmp/msttcore-fonts-installer-2.6-1.noarch.rpm
RUN zypper -n install /tmp/msttcore-fonts-installer-2.6-1.noarch.rpm



