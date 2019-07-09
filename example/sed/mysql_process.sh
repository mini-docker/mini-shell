#!/bin/bash
#
#
# grep -E "^\[" my.cnf
#   
# 找到[] ，
# sed -n '/\[.*\]/p' my.cnf
#  去掉[] ,留下[]中的内容
# | sed -e 's/\[//g' -e 's/\]//g'

FILE_NAME=/root/lesson/5.6/my.cnf

function get_all_segments
{
    echo "`sed -n '/\[.*\]/p' my.cnf | sed -e 's/\[//g' -e 's/\]//g'`"
}

for seg in `get_all_segments`
do 
    echo "配置项：$seg"
done

function count_items_in_segment
{
    # $1 为所传参数
    # 匹配从上一个【】到下一个【】,过滤掉以#开头，空行，以及有【】的字符串
    items=`sed -n '/\['$1'\]/,/\[.*\]/p' $FILE_NAME | grep -v "^#" | grep -v "^$" | grep -v "\[.*\]"`
    index=0
    for item in $items
    do  
        index=`expr $index + 1`
    done
    echo $index
}
# sum = `count_items_in_segment server` 
# echo $sum
number=0
for segment in `get_all_segments`
do 
    number=`expr $number +1`
    items_count=`count_items_in_segment $segment`
    echo "$number: $segment     $items_count"
done
