# 通用部署方案

## 基础镜像
### php
- 基于 php:7.2-fpm
- 常用及自定义扩展安装
### nginx
- 基于 nginx:latest
### redis
- 基于 centos:centos7
- redis-5.0.7
### mysql
- 基于 mysql:5.7
### mycat
- jdk-1.8.0_20
- mycat-1.6.7.3
### haproxy_keepalived
- 基于 haproxy:latest
- 安装keepalived

## 部署方案
### lnmp
nginx + mysql + php 基础环境
- 修改conf目录下的各项配置
- 修改compose文件中的源码、数据、日志目录
- docker-compose up -d 启动
### redis主从
- m_79: 主
- s_80: 从1
- s_81: 从2
### redis哨兵
- sentinel_179: 哨兵1
- sentinel_180: 哨兵2
- sentinel_181: 哨兵3
### redis集群
- 9个节点(200~208)
- 3主各带2从，随机分配
### mycat高可用集群 
- 2 台 mycat + 3 台mysql(主从模式配置待续...)
- haproxy做mycat负载均衡
- keepalived做haproxy高可用
