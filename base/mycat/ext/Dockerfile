FROM centos:centos7
LABEL author=kepreal

COPY jdk-8u20-linux-x64.tar.gz /usr/local/
COPY Mycat-server-1.6.7.3-release-20190828135747-linux.tar.gz /usr/local/

RUN tar -zxvf /usr/local/jdk-8u20-linux-x64.tar.gz -C /usr/local/ \
    && rm -rf /usr/local/jdk-8u20-linux-x64.tar.gz \
    && tar -zxvf /usr/local/Mycat-server-1.6.7.3-release-20190828135747-linux.tar.gz -C /usr/local/ \
    && rm -rf /usr/local/Mycat-server-1.6.7.3-release-20190828135747-linux.tar.gz \

ENV JAVA_HOME=/usr/local/jdk1.8.0_20
ENV PATH=$PATH:$JAVA_HOME/bin
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV MYCAT_HOME=/usr/local/mycat

RUN source /etc/profile \
    && source ~/.bash_profile

#CMD ["/usr/local/mycat/bin/mycat", "console"]