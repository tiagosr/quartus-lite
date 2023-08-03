FROM amd64/ubuntu:lunar

# basic packages
RUN apt-get update && apt-get -y install expect locales wget libtcmalloc-minimal4 libglib2.0-0 && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

# download quartus lite 22.1std
RUN mkdir -p /root/quartus && \
    cd /root/quartus && \
    wget -q http://download.altera.com/akdlm/software/acdsinst/22.1std.2/922/ib_tar/Quartus-lite-22.1std.2.922-linux.tar && \
    tar xvf Quartus-lite-22.1std.2.922-linux.tar

# adding scripts
ADD files/ /
# install quartus lite
RUN /root/setup 22.1std && rm -rf /root/quartus && rm -rf /root/setup*
