-- 
CREATE TABLE `student`(
    `s_id` VARCHAR(20),
    `s_name` VARCHAR(20) NOT NULL DEFAULT '',
    `s_birth` VARCHAR(20) NOT NULL DEFAULT '',
    `s_sex` VARCHAR(10) NOT NULL DEFAULT '',
    PRIMARY KEY(`s_id`)
)

CREATE TABLE `course`(
    `c_id` VARCHAR(20),
    `c_name` VARCHAR(20) NOT NULL DEFAULT '',
    `t_id` VARCHAR(20) NOT NULL,
    PRIMARY KEY(`c_id`)
)

CREATE TABLE `teacher`(
    `t_id` VARCHAR(20),
    `t_name` VARCHAR(20) NOT NULL DEFAULT '',
    PRIMARY KEY(`t_id`)
)

CREATE TABLE `score`(
    `s_id` VARCHAR(20),
    `c_id` VARCHAR(20),
    `s_score` INT(3) ,
    PRIMARY KEY(`s_id`,`c_id`)
)
CREATE TABLE `course`(
    `c_id` VARCHAR(20),
    `c_name` VARCHAR(20) NOT NULL DEFAULT '',
    `t_id` VARCHAR(20) NOT NULL,
    PRIMARY KEY(`c_id`)
)
-- 学生表测试数据
insert into student values('1001','zhaolei','1990-1001-1001','male');
insert into student values('1002','libang','1990-12-21','male');
insert into student values('1003','yahwen','1990-1005-20','male');
insert into student values('1004','hongfei','1990-1008-1006','male');
insert into student values('1005','ligang','1990-12-1001','female');
insert into student values('1006','wangjun','1990-1007-1001','female');
insert into student values('1007','zhoufei','1990-1001-20','female');
-- 课程表测试数据
insert into course values('1001','chinese','1002');
insert into course values('1002','math','1001');
insert into course values('1003','english','1003');

-- 教师表测试数据
insert into teacher values('1001','aidisheng');
insert into teacher values('1002','aiyinsitan');
insert into teacher values('1003','qiansanqiang');

-- 成绩表测试数据
insert into score values('1001', '1001', 80);
insert into score values('1001', '1002', 90);
insert into score values('1001', '1003', 99);
insert into score values('1001', '1001', 70);



