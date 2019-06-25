#!/bin/bash

var1="Hello world"
function test
{
    var2=87
    local var3=88 #局部变量，内部才有值
}
echo $var1
echo $var2
echo $var3

# 当执行了之后var2也成为了全局变量
test
echo $var2
echo $var3










