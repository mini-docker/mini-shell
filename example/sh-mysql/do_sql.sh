#!/bin/bash
#

user="dbuser"
password="123456"
host="192.168.184.132"

mysql_conn="mysql -u"$user" -p"$password" -h"$host""
IFS=" || "
# IFS=":"
# $1 需要读取的文件路径 sh do_sql.sh $1
cat $1 | while read id name birth sex
do 
    if [ $id -gt 1014 ];then
        echo "('$id','$name','$birth','$sex')"
        # $mysql_conn -e "INSERT INTO school.student1 values('$id','$name','$birth','$sex')"
    fi
done



