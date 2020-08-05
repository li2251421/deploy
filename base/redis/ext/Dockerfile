FROM centos:centos7
LABEL author=kepreal
RUN groupadd -r redis && useradd -r -g redis redis
RUN mkdir data ;\
    yum update -y ; \
    yum -y install gcc automake autoconf libtool make wget epel-release gcc-c++;

COPY ./redis-5.0.7.tar.gz redis-5.0.7.tar.gz
RUN mkdir -p /usr/local/src/redis; \
    tar -zxvf redis-5.0.7.tar.gz -C /usr/local/src/redis; \
    rm -rf redis-5.0.7.tar.gz; \
    cd /usr/local/src/redis/redis-5.0.7 && make ; \
    cd /usr/local/src/redis/redis-5.0.7 && make install

#COPY ./conf/redis.conf /etc/redis/redis.conf

EXPOSE 6379

#ENTRYPOINT ["redis-server", "/etc/redis/redis.conf"]

# docker build -t redis5-base .
# docker run -itd --name redis5-base -v ./data:/var/data/redis -v ./log:/var/log/redis -p 6379:6379 redis5-base
