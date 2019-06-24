### shell类型变量
#!/bin/bash

var2="hello world"
echo $var2
declare -r var2
# var2="hello world3"

num1=10
num2=$num1+20
echo $num2

declare -i num3
num3=$num1+90
echo $num3

#获取数组
array=("jones" "mike" "kobe" "jordan")
echo ${array[@]}
echo ${array[0]}
echo ${#array[@]} #数组长度
echo ${#array[0]} #数组第一个元素长度

#给数组某个下标赋值:
    # array[0]="lily"
    # array[20]="hanmeimei"
#删除元素
    # unset array[2] #清除元素
    # unset array #清空整个数组

# 分片访问：
    # ${array[@]:1:4} #显示数组下标索引从1开始到3的3个元素
# 内容替换：
    # ${array[@]/an/AN} #将数组中所有元素内包含an的字符串替换为AN
# 数组遍历：
    # for v in ${array[@]}
    # do 
    #     echo $v
    # done


# declare -x
#     声明为环境变量，可以在脚本中直接使用

# 取消声明的变量：
#     declare +r
#     declare +i
#     declare +a
#     declare +X


# bash 数学运算 operator(+-*/)
# expr $num1 operator $num2
# $(($num1 operator $num2))

numn=90
expr $numn + 1

## 练习：
# 提示用户输入一个正整数num，然后计算1+2+3+...+num的值；必须对num是否为正整数做判断，不符合允许再次输入

while true
do

    read -p "pls input a positive number: " num

    expr $num + 1 &> /dev/null

    if [ $? -eq 0 ];then
        sum=0
        if [ `expr $num \> 0` -eq 1 ];then
            # echo "Yes,Positv number"
            for ((i=1;i<=$num;i++))
            do
                sum=`expr $sum + $i`
            done
            echo "1+2+3+....+$num = $sum"
            exit
        else
            echo "error, input unlegal"
        fi
    fi
    echo "error, input unlegal"
    continue

done

