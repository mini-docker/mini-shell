#!/bin/bash
#
# 获取系统的所有用户并输出

for user in `cat /etc/passwd | cut -d ":" -f 1`
do
    echo "This is $index user: $user"
    index=$(($index+1))
done


