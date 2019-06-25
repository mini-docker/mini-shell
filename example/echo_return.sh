#!/bin/bash

this_pid=$$

#  查看执行过程 sh -x echo_return.sh

function is_nginx_running
{
    ps -ef | grep nginx | grep -v grep | grep -v $this_pid &> /dev/null
    if [ $? -eq 0 ];then
        return
    else
        return 1
    fi
}

is_nginx_running && echo "Nginx is runngin" || echo "Nginx is stoped"

function get_users
{
    users=`cat /etc/passwd | cut -d ":" -f1`
    echo $users
}

user_list=`get_users`

for u in $user_list
do 
    echo "The $index user is : $u"
    index=$(($index+1))
done


