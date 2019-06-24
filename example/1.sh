# 需求描述：
# 变量string="Bigdata process frameword is Hadoop,Hadoop is an open source project"
# 执行脚本后，打印出string字符串变量，并给出用户一下选项
# 1，打印string长度
# 2，删除字符串中的所有Hadoop
# 3，替换第一个Hadoop为Mapreduce
# 4，替换全部Hadoop为MapReduce

# 用户输入数字1|2|3|4，可以执行对应项的功能：输入q|Q则退出交互模式

#!/bin/bash
#
string="Bigdata process frameword is Hadoop,Hadoop is an open source project"

function print_tips
{
    echo "******************************"
    echo "(1) 打印string长度"
    echo "(2) 删除字符串中的所有Hadoop"
    echo "(3) 替换第一个Hadoop为Mapreduce"
    echo "(4) 替换全部Hadoop为MapReduce"
    echo "*******************************"
}

function len_of_string
{

    echo "${#string}"
}

function del_hadoop
{
    echo "${string//Hadoop/}"
}

function rep_hadoop_mapreduce_first
{
    echo "${string/Hadoop/Mapreduce}"
}

function rep_hadoop_mapreduce_all
{
    echo "${string//Hadoop/Mapreduce}"
}

while true
do
    echo "[string=$string]"
    echo
    print_tips
    read -p "Pls input your choice(1|2|3|4|q|Q): " choice

    case $choice in
        1)
            len_of_string
            ;;
        2)
            del_hadoop
            ;;
        3)
            rep_hadoop_mapreduce_first
            ;;
        4)
            rep_hadoop_mapreduce_all
            ;;
        q|Q)
            exit
            ;;
        *)
            echo "Error,input only in {1|2|3|4|q|Q}"
            ;;
    esac
done



