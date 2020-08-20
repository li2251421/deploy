FROM haproxy:latest

LABEL author=kepreal

ENV LANG=zh_CN.UTF-8

RUN groupadd -r haproxy && useradd -r -g haproxy haproxy \
    && apt-get update && apt-get install -y net-tools iputils-ping vim procps keepalived \
    && apt-get install -y locales \
    && rm -r /var/lib/apt/lists/* \
    && sed -ie 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/g' /etc/locale.gen \
    && locale-gen \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && mkdir -p /var/log/keepalived