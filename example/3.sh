#!/bin/bash
#
# 计算今年或者明年
echo "This is $(($(date +%Y)+1)) year"
num1=50
num2=70
echo $(($num1+$num2))
echo $((num1+num2))

# 根据系统时间获取今年还剩下多少个星期，已经多了多少个星期
# man date /date +%j
echo "This year passed $(date +%j) days"
echo "This year passed $(($(date +%j)/7)) weeks"

echo "There is $((365 - $(date +%j))) days before new year"
echo "There is $(((365 - $(date +%j))/7)) weeks before new year"

# 判定nginx进程是否存在，若不存在则自动拉起进程
nginx_process_num=$(ps -ef | grep nginx | grep -v grep | wc -l)
if [ $nginx_process_num -eq 0 ];then
    sudo nginx
fi

# $(((100+30)/13))
# num1=20;num2=30
# ((num++))
# ((num--))
# $(($num1+$num2*2))
