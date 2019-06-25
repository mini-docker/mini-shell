#!/bin/bash

# 函数库：
# 定义一个函数库，该函数库实现以下几个函数：
# 加法函数add 减法函数reduce 乘法函数multiple 除法函数divide
# 打印系统运行情况的函数sys_load,该函数可显示内存运行情况,磁盘使用情况
# add 12 89 reduc 80 20

function add
{
    echo "`expr $1 + $2`"
}

function reduce
{
    echo "`expr $1 - $2`"
}

function multiple
{
    echo "`expr $1 \* $2`"
}

function divide
{
    echo "`expr $1 / $2`"
}

function sys_load
{
    echo "Memory Info"
    echo
    # free -m
    echo

    echo "Disk Usage"
    echo
    df -h
    echo
}

