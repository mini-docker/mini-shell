
BEGIN{
    FS=":"
}{
    if($3<50) {
        printf "%-10s%-10s%-5d\n","小于50的UID",$1,$3
    }
    else if($3>50 && $3<100) {
        printf "%-20s%-20s%-5d%\n","大于50且小于100的UID",$1,$3
    }
    else{
        printf "%-20s%-20s-5d%\n","大于100的UID",$1$,$3
    }
}





