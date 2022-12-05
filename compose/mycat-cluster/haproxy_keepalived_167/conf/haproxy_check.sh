#!/bin/bash

if [ ! -d /var/log/keepalived ];then
  mkdir /var/log/keepalived
fi

LOG_FILE="/var/log/keepalived/haproxy-check.log" # 日志文件
date "+%Y-%m-%d %H:%M:%S" >> $LOG_FILE #在日志文件当中记录检测时间
echo "check haproxy status....." >> $LOG_FILE # 记录haproxy的状态

HAPS=`ps -C haproxy --no-header | wc -l` # 检测haproxy的状态，0代表未启动,1已经启动

if [ $HAPS -eq 0 ];then
    echo "reload haproxy：/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg" >> $LOG_FILE
    /usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg #启动haproxy
    sleep 3
    if [ `ps -C haproxy --no-header | wc -l` -eq 0 ];then
        echo "haproxy reload failed, killall keepalived" >> $LOG_FILE
        killall keepalived
        service keepalived stop
    else
        echo "haproxy reload success" >> $LOG_FILE
    fi
else
    echo "haproxy is runing" >> $LOG_FILE
fi
echo "====================================================" >> $LOG_FILE