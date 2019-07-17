#!/bin/bash
#

user="dbuser"
password="123456"
host="192.168.184.132"

mysql_conn="mysql -u"$user" -p"$password" -h"$host""

cat sql.txt | while read id name birth sex
do
    $mysql_conn -e "INSERT INTO school.student values("$id","$name","$birth","$sex")"
done

