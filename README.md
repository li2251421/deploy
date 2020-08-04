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
### mycat集群 待续...
### redis哨兵 待续...
### redis集群 待续...
