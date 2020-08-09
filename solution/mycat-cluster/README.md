
## mysql节点创建数据库test
```sql
CREATE DATABASE IF NOT EXISTS test DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
```

## mycat节点操作
mysql -uroot -proot -P8066 -h 192.168.220.178
mysql -uroot -proot -P8067 -h 192.168.220.178

```sql
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