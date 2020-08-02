FROM php:7.2-fpm

# 更新为国内镜像
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo 'deb http://mirrors.163.com/debian/ stretch main non-free contrib' > /etc/apt/sources.list \
    && echo 'deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib' >> /etc/apt/sources.list \
    && echo 'deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib' >> /etc/apt/sources.list \
    && apt-get update

# pdo_mysql, bcmath 精度处理, sockets 通信, pcntl 进程控制, shmop 共享内存
#  sysvmsg 进程通信, sysvsem 信号量, sysvshm 共享内存
RUN docker-php-ext-install -j$(nproc) iconv pdo_mysql bcmath sockets pcntl shmop sysvmsg sysvsem sysvshm

# GD 扩展 图形处理
# zlib1g-dev : Depends: zlib1g (= 1:1.2.8.dfsg-5) but 1:1.2.11.dfsg-1 is to be installed
RUN apt-get install -y --no-install-recommends --allow-downgrades libfreetype6-dev libjpeg62-turbo-dev libpng-dev zlib1g=1:1.2.8.dfsg-5 zlib1g-dev \
    && rm -r /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

# opcache 扩展
RUN docker-php-ext-configure opcache --enable-opcache && docker-php-ext-install opcache

# xdebug 扩展
RUN pecl install xdebug-2.7.0 && docker-php-ext-enable xdebug

# redis 扩展
RUN pecl install redis-5.3.1 && docker-php-ext-enable redis

# swoole 扩展
RUN pecl install swoole-4.5.2 && docker-php-ext-enable swoole
