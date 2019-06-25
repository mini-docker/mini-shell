#!/bin/bash
test()
{
    echo "test function"
}

function test2
{
    echo "test2 function"
}

# cat function_test.sh 查看脚本内容
# nginx 守护进程执行的脚本名字不能带有 nginx，否则会对执行结果造成干扰
# ps -ef | grep nginx # 查看nginx进程是否存在

    # this_pid=$$ # 获取子进程的pid

    # while true
    # do
    # status=`ps -ef | grep nginx | grep -v grep | grep -v $this_pid &> /dev/null` #进而过滤子进程的pid

    # if [ $? -eq 0 ];then
    #     echo "Nginx is running well"
    #     sleep 3
    # else
    #     sudo nginx
    #     echo "Nginx is down, Start it..."
    # fi
    # done

# 向函数传递参数：
    # 函数传参和脚本传参类似，都是使用$1 $2 $3 $4
    # 例子1：
        # 需求描述：写一个脚本，该脚本可以实现计算器的功能，可以进行+-*/四种计算。
        # sh calculate.sh 30 + 40 ... sh calculate.sh 30 * 40

function calcu
{
    case $2 in
        +)
            echo "`expr $1 + $3`"
            ;;
        -)
            echo "`expr $1 - $3`"
            ;;
        \*)
            echo "`expr $1 \* $3`"
            ;;
        /)
            echo "`expr $1 / $3`"
            ;;

    esac
}

calcu $1 $2 $3
