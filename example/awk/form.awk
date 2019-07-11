# BEGIN{
#     printf "%-10s%-10s%-10s%-10s%-10s%-10s\n","Name","Chinese","English","Math","Physical","Average"
# }
# {
#     total=$2+$3+$4+$5
#     avg=total/4
#     if(avg>90)
#     {
#         printf "%-10s%-10d%-10d%-10d%-10d%-0.2f\n", $1, $2, $3, $4, $5, avg
#         score_chinese+=$2
#         score_english+=$3
#         score_math+=$4
#         score_physical+=$5
#     }
# }
# END{
#     printf "%-10s%-10d%-10d%-10d%-10d\n","",score_chinese,score_english,score_math,score_physical
# }

### 横向计算
BEGIN{
    printf "%-10s%-10s%-10s%-10s%-10s%-10s\n","Name","Yuwen","Math","English","Pysical","Total"
}
{
    total=$2+$3+$4+$5
    yuwen_sum+=$2
    math_sum+=$3
    eng_sum+=$4
    phy_sum+=$5
    printf "%-10s%-10d%-10d%-10d%-10d\n",$1, $2, $3, $4, $5,total
}
END{
    printf "%-10s%-10d%-10d%-10d%-10d\n","",yuwen_sum,math_sum,eng_sum,phy_sum
}


