### mysql语言分类
- DML数据操纵语言 用于查询、生成、修改、删除数据库中的数据
```
DML语言包含用于查询数据（SELECT）
添加新行数据 insert
修改现有行数据  update
删除现有航数据 delete
```
- DDL数据定义语言 用于定义、修改、删除数据库模式对象，进行权限管理等。
```
DDL语言包括创建、修改、删除或者重命名模式对象(CREAGTE/ALTER/DROP/RENAME)
删除表中所有行但不删除表(TRUNCATE)
DDL语言是自动提交的
```
- DCL 权限控制语言 用来设置或者更改数据库用户或角色权限的语句。
```
GRANT 授权
REVOKE  取消授权
```
- TCL 事务控制语言 用于数据库的事务管理
```
COMMIT  提交
SAVEPOINT   设置保存点
ROLLBACK    回滚
START TRANSACTION   开始事务
```
- MySQL常见对象 
```
数据库/模式(DataBase/Schema): 多数据库，业务和资源隔离
表(Table)
索引(Index)
视图(View)
约束(Constraint)
触发器(Trigger)
函数(Function)
存储过程(Procedure)

```

### 常用sql命令
```sql

show databases;

create datebase inpux1 default character set UTF8 defaut collate utf8_general_cli;

show databases like 'it%';

drop database itpux2;

```

### mysqladmin工具
```
mysqladmin create inpux1 -uroot -p
mysqladmin drop inpux1 -uroot -p

```

### 三、数据类型
#### 3.1 数值类型
##### 3.1.1 整数
```sql
tinyint (取值范围：有符号：-128~127，无符号： 0-255，占1个字节(8bit))
smallint (取值范围：有符号：-32768~32767，默认有符号；无符号： 0-65535，占2个字节,取值5位)
mediumint (取值范围：有符号：-8388608~8388607，默认有符号；无符号： 0-16777215，占3个字节,取值8位)
int (取值范围：有符号：-2147483648~2147483647，默认有符号；无符号： 0-4294967295，占4个字节,取值11位)
bigint (取值范围：有符号：-20位，默认有符号；无符号： 0-20位，占8个字节,取值20位)

-- 以上5个类型都有的属性
int[unsigned]: 控制是否有正负数，如果是正数(无符号)0~255，反之为-128~127
int[zerofill]: 用来进行前导零填充。(如果数值为3位，但是身为1，则转换为001)
M:取值范围：int(5),表示最小宽度是多少，不会影响宽度大于M的数字

-- 案例1：无参数控制
create table itpux01(id01 tinyint,id02 int);
select * from itpux01;
desc itpux01;

insert into itpux01 values(100,101);
insert into itpux01 values(1,12);
insert into itpux01 values(-1,12);
select * from inpux01;
insert into itpux01 values(127,12);
insert into itpux01 values(1270,120000000000); --error
insert into itpux01 values(-127,12);
insert into itpux01 values(-129,12); -- 超出范围应该报错，mysql部分版本不会报错

-- 案例2：有参数控制
create table itpux02(id01 tinyint(3) unsigned zerofill,id02 int(3) unsigned zerofill);
desc itpux02;
insert into itpux02 values(1,1);
select * from itpux02;
insert into itpux02 values(12,1234);
insert into itpux02 values(1212,1234); --error
insert into itpux02 values(-12,-123); --error

```
##### 3.1.2 小数
```sql



```