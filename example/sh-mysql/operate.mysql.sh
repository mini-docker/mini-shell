#!/bin/bash
#

user="dbuser"
password="123456"
host="192.168.184.132"

SQL="$2"

# sh operate_mysql.sh school "SELECT * FROM score"
mysql -u"$user" -p"$password" -h"$host" -D"$1" -B -e "$SQL"


