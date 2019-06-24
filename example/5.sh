#!/bin/bash

echo "23+35" | bc
echo "23.3+35" | bc
echo "scale=4;23.3/3.5" | bc

read -p "num1: " num1
read -p "num2: " num2

num3=`echo "scale=4;$num1/$num2" | bc`


echo "$num1 / $num2 = $num3"

