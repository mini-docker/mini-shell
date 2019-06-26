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
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/number_type.png)
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

    decimal (numeric) (M,D) 
    非压缩浮点数 不能是无符号的，每个小数对应一个字节，M长度，D小数位数,默认10，2，最大M65,D30

    float   (M,D) 
    单精度：不能使用无符号的浮点数字 M长度，D小数位数； 值10,2 一共10位,其中两位小数位数; 占四个字节
    不写(M,D),自动处理M为7左右

    double (M,D) 
    双精度：不能使用无符号的双精度浮点数据，M长度，D小数位数；值10,2 一共10位,其中两位小数位数; 占8个字节
    不写(M,D),自动处理M为15左右

    参数
    zerofill
    unsigned

案例1：float、double类型

    创建一个没有格式控制的表
    create table itpuxf1(f1 float,f2 double);
    insert into itpuxf1 values(-12.123,-1234.5678);
    insert into itpuxf1 values(-12.123,-1234.5678);
    select * from itpuxf1;

    创建一个有格式控制的表
    create table itpuxf2(f1 float(5,2) unsigned zerofill,f2 double(6,3) unsigned zerofill);
    desc itpuxf2;
    insert into itpuxf2 values(12.34,12.34); -- 12.34 12.340
    insert into itpuxf2 values(1.1,1.2);    -- 01.10 01.200
    insert into itpuxf2 values(123.45,123.345); -- 123.45 123.345
    select * from itpuxf2;

    科学计数法(E),小数点向右移动几位。
    insert into itpuxf2 values(0.1234E2,0.123456E3);
    select * from itpuxf2;
    -- 插入位数多了，就会四舍五入
    insert into itpuxf2 values(12.126,12.34);
    insert into itpuxf2 values(12.121,12.3750);

案例2：decimal类型定点数

    drop table itpux03;
    create table itpux03(f DECIMAL(10,4) unsigned zerofill);
    insert into itpux03 values(1);
    insert into itpux03 values(123.45); -- 000123.4500
    insert into inpux03 values(123.4567); -- 000123.4567
    insert into inpux03 values(123.45678); -- 000123.4568
    select * from itpux03;

    create table itpux04(f DECIMAL(10,4));
    insert into itpux04 values(1);
    insert into itpux04 values(123.45); -- 123.4500
    select * from itpux04;

```

#### 3.2 日期类型
##### 3.2.1 datatime(年月日时分秒) YYYY-MM-DD HH:MM:SS 1000~9999
```sql
create table itpuxd1(mydate datatime);
insert into itpuxd1 values('20180305103030');
insert into itpuxd1 values(20180305103030);
insert into itpuxd1 values('2018-03-05 10:30:30');
select * from itpuxd1;
insert into itpuxd1 values();
insert into itpuxd1 values(0); --error
insert into itpuxd1 values('2018-03-05')
```
##### 3.2.2 timestamp(年月日时分秒/整数) YYYY-MM-DD HH:MM:SS 1970-2038
```sql
-- 用整数、字符串都可以存储
create table itpuxd2(t timestamp);
insert into itpuxd2 values('20180305103030');
insert into itpuxd2 values('2018-03-05 10:30:30');
select * from itpuxd2;
-- +0 查看时间戳，显示整数
select t+0 from itpuxd2;

```

##### 3.2.3 date(年月日)
```sql
create table itpuxd3(t date);
insert into itpuxd3 values('20180305'); --OK
insert into itpuxd3 values('2018-03-05'); --OK
insert into itpuxd3 values('2018:03:05'); --OK
insert into itpuxd3 values('18:03:05'); -- 2018 03 05
insert into itpuxd3 values('80:03:05'); -- 1980 03 05
insert into itpuxd3 values('20180305103030');
select * from itpuxd3;
```

##### 3.2.4 time(时间) HH：MM：SS
```sql
D 代表天，最大可以是34天，代表过去多少时间

create table itpuxd4(t time);
insert into itpuxd4('10:30:30');
insert into itpuxd4('5 10:30:30'); -- 过去5天10点30分30秒 5X24+10：30：30
select * from itpuxd4;

```
##### 3.2.5 year YYYY
```sql
create table itpuxd5('y' year);
insert into itpuxd5 values(1234); --error
insert into itpuxd5 values(2018);
insert into itpuxd5 values(2016);
select * from itpuxd5;
```

#### 3.3 字符类型
##### 3.3.1 char
##### 3.3.2 varchar
char 与 varchar之间的区别
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/char_varchar.png)
```sql
-- char (M),M表示字符固定长度，1ab，255字节
-- 一直占4个字节 只能保存4个字节 多了就减
create table itpuxz1 (c CHAR(255));
insert into itpuxz1 values('Yes');
insert into itpuxz1 values('No');
insert into itpuxz1 values('Y '); -- 在查询时会自动把后面的空格删掉
select * from itpuxz1;
select c,LENGTH(c) from itpuxz1;

-- varchar (M),M表示字符可变长度，65536字节，需要1~2字节来保存信息，超过255的长度就是用2个来保存
-- 不够就加
create table itpuxz2(c varchar(65535)); -- error
create table itpuxz2(c varchar(21845)); -- error
create table itpuxz2(c varchar(21844)); -- ok
insert into itpuxz2 values('Yes');
insert into itpuxz2 values('No');
insert into itpuxz2 values('Y  '); -- 在查询时不会把后面的空格删掉
insert into itpuxz2 values('  Y');
select * from itpuxz2;
select c,LENGTH(c) from itpuxz2;

utf8：一个字符占用3个字节 65535/3 = 21845 (-1/-2) => 21844/21843 少一或者两个字节
gbk：一个字符占用2个字节 65535/2 = 32767 (-1/-2) => 32766/32765

最大长度是受最大行数65535字节和所使用字符集有关。

```



text 

blob

enum

set






