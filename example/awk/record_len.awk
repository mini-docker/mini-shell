#!/bin/bash

#1,统计每个人员分别插入了多少条record进数据库

BEGIN
{
    printf "%-10s%-10s\n","User","Total Records"
}
{
    USER[$6]+=$8
}
END
{
    for(u in USER)
        print u,USER[u]
}



