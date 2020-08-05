# 通用部署方案

## 基础镜像
### php
- 基于 php:7.2-fpm
- 常用扩展安装

## 部署方案
### lnmp
nginx + mysql + php 基础环境
- 修改conf目录下的各项配置
- 修改compose文件中的源码、数据、日志目录
- docker-compose up -d 启动
### redis主从
m_79: 主
s_80: 从1
s_81: 从2
### redis哨兵
sentinel_179: 哨兵1
sentinel_180: 哨兵2
sentinel_181: 哨兵3
### redis集群
200、201、202、203、204、205
redis-cli --cluster create 192.168.1.200:6379 192.168.1.201:6379 192.168.1.202:6379 192.168.1.203:6379 192.168.1.204:6379 192.168.1.205:6379 --cluster-replicas 1
### mycat集群 待续...