
## 架构
```apacheconfig
vip: 192.168.220.100 => 192.168.220.178

vip: 192.168.10.100 => 
                    192.168.10.166
                    192.168.10.167
                    
http://192.168.220.100:1080/haproxyadmin?stats
http://192.168.220.100:1081/haproxyadmin?stats

host:192.168.220.100:8066 => haproxy:192.168.10.100:8066

haproxy:192.168.220.100:8166(192.168.10.166:8066) => 
haproxy:192.168.220.100:8167(192.168.10.167:8066) =>
                        mycat1: 192.168.10.66:8066
                        mycat2: 192.168.10.67:8066
```

## 操作
手动启动keepalived
```shell
//手动启动keepalived
docker exec -it haproxy_keepalived_166 /bin/bash
chmod +x /etc/keepalived/haproxy_check.sh
service keepalived start

docker exec -it haproxy_keepalived_167 /bin/bash
chmod +x /etc/keepalived/haproxy_check.sh
service keepalived start
```
客户端连接mysql
```sql
mysql -uroot -proot -P8066 -h 192.168.220.100

CREATE DATABASE IF NOT EXISTS test DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `orders`(
   `id` bigint UNSIGNED,
   `user_id` int UNSIGNED DEFAULT 0 NOT NULL,
   PRIMARY KEY ( `id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `orders`(id, user_id) values(1, 1);
insert into `orders`(id, user_id) values(2, 2);
insert into `orders`(id, user_id) values(3, 3);

insert into `orders`(id, user_id) values(5000001, 123);

select * from `orders` order by id desc;
```
异常操作
```shell
进入166容器，停止haproxy进程
docker exec -it haproxy_keepalived_166 /bin/bash
ps -ef | grep haproxy
kill -9 1

docker exec -it haproxy_keepalived_167 /bin/bash
ip addr
发现抢占了 vip: 192.168.10.100

客户端连接正常，实现高可用

```