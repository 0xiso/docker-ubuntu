FROM ubuntu

RUN set -x \
    && sed -i -e "s%http://archive.ubuntu.com/ubuntu/%http://linux.yz.yamagata-u.ac.jp/ubuntu/%g" /etc/apt/sources.list \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        binutils \
        ca-certificates \
        command-not-found \
        curl \
        dnsutils \
        file \
        fish \
        iproute2 \
        iputils-ping \
        locales \
        net-tools \
        netcat \
        python3 \
        python3-pip \
        tcpdump \
        unzip \
        vim \
        wget \
        whois \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8
CMD /usr/bin/fish