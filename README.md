# mini-shell
mini-shell

### 注意
- 不适合在root权限下练习shell脚本书写
- 在mac环境下变量赋值不能加空格
- 执行脚本 sh "sh脚本地址"

### 变量替换总结
- 1、${变量#匹配规则}               # 从头开始匹配，最短删除
- 2、${变量##匹配规则}              # 从头开始匹配，最长删除
- 3、${变量%匹配规则}               # 从尾开始匹配，最短删除
- 4、${变量%%匹配规则}              # 从尾开始匹配，最长删除
- 5、${变量/旧字符串/新字符串}        # 替换变量内的旧字符串为新字符串，只替换第一个
- 6、${变量//旧字符串/新字符串}       # 替换变量内的旧字符串为新字符串，全部替换

### 实例语句
```shell
    variable_1="I love you,Do you love me"
    echo $variable_1
    var1=${variable_1#*ov}
    echo ${var1}
    var2=${variable_1##*ov}
    echo $var2
    var3=${variable_1%ov*}
    echo $var3
    var4=${variable_1%%ov*}
    echo $var4

    echo $PATH
    var5=${PATH/bin/BIN}
    echo $var5
    var6=${PATH//bin/BIN}
    echo $var6
```

### 字符串
#### 1，计算字符串长度
- ${#string}

#### 2，获取子串在字符串中的索引位置
- expr match $string substr

#### 4，抽取子串
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/3.png)
```shell
    ### 获取字符串长度
    # var1="quickstart is a app"
    # echo $var1
    # ind=`expr index "$var1" start`
    # echo $ind
    # ind=`expr index "$var1" uniq`
    # echo $ind => 1 q<=>q
    # ind=`expr index "$var1" cnk`
    # echo $ind => 4 c<=>c

    ### 获取子串长度
    # expr match "$string" substr
    # 例子：
    # var1="quickstart is a app"
    # sub_len=`expr match "$var1" app`

    ### 抽取字符串中的子串
    1，${string:position}/${string:position:length}/${string:(-)position}
    var1="kafka hadoop yarn mapreduce"
    substr1=${var1:10}
    substr2=${var1:10:5}
    echo $substr1 # op yarn mapreduce
    substr3=${var1:-5} # educe
    substr4=${var1:-5:2} # ed

    # 2，expr substr $string $position $length
    # substr5=`expr substr "$var1" 10 5` # oop y
    ### !注意 使用expr，索引计数是从1开始计算：使用${string:position}是从0开始计算
    
```

### 命令替换
- 1，`command`
- 2，${command}
```shell
    #1, 获取系统的所有用户并输出
    cat /etc/passwd
    man cat #获取cat命令及对应功能

    # -b为非空输出行编号，从1开始。
    # -e显示非打印字符(请参阅-v选项)，并显示每一行末尾都有一个美元符号(' $')。
    # -n表示输出行数，从1开始。
    # -s压缩多个相邻空行，导致输出为单一的间隔。
    # -t显示非打印字符(请参阅-v选项)，并显示制表符为' ^I'。禁用输出缓冲。
    # -v显示非打印字符，使其可见。控制字符打印为' ^X'为control-X;删除字符(八进制0177)打印为' ^?'。非ascii字符(高位集)被打印为“M-”(用于meta)，后跟字符对于低7位。
    # -d 以“:”分割
    
    # 获取系统的所有用户并输出
    cat /etc/passwd | cut -d ":" -f 1 


```

### shell有类型变量
- declare和typeset命令
- declare命令和typeset命令两者等价
- declare\typeset都是用来定义变量类型的
- ![4.sh](https://github.com/mini-docker/mini-shell/blob/master/img/4.png)
#### bash数学运算 expr bc
- ![4.sh](https://github.com/mini-docker/mini-shell/blob/master/img/expr1.png)
- bc是bash内建的运算器，支持浮点数运算
- 内建变量scale可以设置，默认为0，保存多少位小数
- ![bc](https://github.com/mini-docker/mini-shell/blob/master/img/bc.png)
- ![bc2](https://github.com/mini-docker/mini-shell/blob/master/img/bc2.png)
- 直接运行`bc`命令进行计算操作


### shell函数
#### 函数格式
```shell
# 格式1
name()
{
    command1,
    command2,
    ...
};
# 格式2
function name
{
    command1,
    command2,
    ...
}
# 函数调用 直接使用函数名 [function.sh]
function_name $1 $2 => $1 $2为参数 
sh function_test.sh 20 + 30 => 50

# 返回值的方式
return 
只能返回1-255的整数
通常只是用来供其他地方调用获取状态，因此通常仅返回0或1；0成功1失败；

echo
可以返回任何字符串结果
通常用于返回数据，比如一个字符串值或列表

# 查看执行过程 sh -x aaa.sh

```
#### 局部变量和全局变量(var.sh)
```shell
# 不做特殊声明，shell中变量都是全局变量
# Tips：大型脚本程序中函数慎用全局变量 

## 局部变量
定义变量时，使用local关键字
函数内和函数外若存在同名变量，则内部变量覆盖外部变量

```
#### 函数库
```
存在的意义：经常使用的重复代码封装成函数文件
一般不直接执行，而是有其他脚本调用

库文件名的后缀是任意的，但一般使用.lib
库文件通常没有可执行选项
库文件无需和脚本在同级目录，只需在脚本中引用时指定
```

### 文件查找之find命令
- ![find_param1](https://github.com/mini-docker/mini-shell/blob/master/img/find_param1.png)
- ![find_param2](https://github.com/mini-docker/mini-shell/blob/master/img/find_param2.png)

```shell
# 语法格式 find[路径][选项][操作]
-name 查找/etc目录下以conf结尾的文件        find /usr/local/etc/nginx -name '*.conf'
-iname 查找当前目录下文件名为aa的文件，不区分大小写  find . -iname aa
-user 查找文件属于为hdfs的所有文件                  find . -user hdfs
-group 查找文件属组为yarn的所有文件                 find . -group yarn
-type 
    f 文件              find . -type f
    d 目录              find . -type d
    c 字符设备文件        find . -type c 
    b 块设备文件        find . -type b
    l 链接文件          find . -type l
    p 管道文件          find . -type p

-size
    -n 大小大于n的文件
    +n 大小小于n的文件
    n 大小等于n的文件

    例子1： 查找/etc目录下小于10000字节的文件 find /etc size -1000c
    例子2：查找/etc目录大于1M的文件 find /etc size +1M

-mtime
    -n n天以内修改的文件
    +n n天以外修改的文件
    n 正好n天修改的文件

    例子1：查找/etc目录下 5天以内修改且以conf结尾的文件 find /usr/local/etc/nginx -mtime -5 -name '*.conf'
    例子2：查找/etc目录下 10天之前修改且属主为root的文件 find /usr/local/etc/nginx -mtime +10 -user root

-mmin
    -n n分钟以内修改的文件
    +n n分钟以外修改的文件

    例子1：查找/etc目录下 30分钟之前修改 的文件 find /usr/local/etc/nginx -mmin +30 
    例子2：查找/etc目录下 30分钟之内修改 的文件 find /usr/local/etc/nginx -mmin -30 -type d

-mindepth n 表示从n级子目录开始搜索
    例子：在/etc下的3级子目录开始搜索 find /usr/local/etc/nginx -mindepth 3

-maxdepth n 表示最多搜索到n-1级子目录
    例子1：在/etc下搜索符合条件的文件，但最多搜索到2级子目录 find /usr/local/etc/nginx -maxdepth 3 -name '*.conf'
    例子2： find /usr/local/etc/nginx -type f -name '*.conf' -size +10k -maxdepth 2


- 命令可以串起来
find /usr/local/etc/nginx -mtime -5 -name '*.conf'

-nouser 查找没有属主的用户
    例子 find . -type f -nouser
-nogroup 查找没有数组的用户
    例子 find . -type f -nogroup
-perm 查看权限
    find . -perm 664

-prune
    通常和 -path 一起使用，用于将特定目录排除在搜索条件之外
    例子1，查找当前目录下所有普通文件，但排除etc目录
        find . -path ./etc -prune -o -type f
    例子2，查找当前目录下所有普通文件，但排除etc和opt目录
        find . -path ./etc -prune -o -path ./opt -prune -o -type f
    例子3，查找当前目录下所有普通文件，但排除etc和opt目录，但属主为hdfs
        find . -path ./etc -prune -o -path ./opt -prune -o -type f -a -user hdfs
    例子4，查找当前目录下所有普通文件，但排除etc和opt目录，但属主为hdfs，且文件大小必须大于500字节
        find . -path ./etc -prune -o -path ./opt -prune -o -type f -a -user hdfs -a -size +500c

-newer file1
    查找比file1更新的文件

## 操作
-print 打印输出 一般命令，输出自带
-exec   对搜索到的文件执行特定的操作，格式为-exec 'command' {} \;
    例子1，搜索/etc下的文件(非目录)，文件名以conf结尾，且大于10k，然后将其删除
        find ./etc/ -type f -name '*.conf' -size +10k -exec rm -f {} \;
    例子2，将/var/log/目录下以log结尾的文件，且更改时间在7天以上的删除
        find /var/log/ -name '*.log' -mtime +7 -exec rm -rf {} \;
    例子3，搜索条件和例子1一样，只是不删除，而是将其复制到/root/conf目录下
        find ./etc/ -size +10k -type f -name '*.conf' -exec cp {} /root/conf/ \;
-ok 和exec功能一样，只是每次操作都会给用户提示

```
### find、locate、whereis 和which 总结及使用场景分析
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/command_environment.png)
```shell
# 文件查找命令，所属软件包mlocate
# 不同于find命令是在整块磁盘中搜索，locate命令在数据库文件中查找
# find是默认全部匹配，locate则是默认部分匹配

-- updatedb 命令
# 用户更新/var/lib/mlocate/mlocate.db
# 所使用配置文件/etc/updatedb.conf
# 改命令在后台cron计划任务重定期执行
# 查找数据库数据文件相关命令 locate
# locate my.cnf
-- whereis
# -b 只返回二进制文件
# -m 只返回帮助文档文件
# -s 只返回源代码文件
-- which
# -b 只返回二进制文件

```
### grep 和 egrep
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/grep1.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/grep2.png)
```shell
## grep
    grep server nginx.conf # 从nginx.conf文件中筛选出有server的字符
    grep server -v nginx.conf # 从nginx.conf文件中筛选出不是server的字符
    grep server -vi nginx.conf # v,i命令同时使用

    grep -E "python|PYTHON" nginx.conf
    grep -F "py.*" nginx.conf #F 查找字面意思

    grep -r love # 文件夹下忽略大小写全部搜索

    mkdir test1/test2/test3 -pv
# 了解
    -c 只输出匹配行的数量，不显示具体内容
    -w 匹配整词
    -x 匹配整行
    -l 只列出匹配的文件名，不显示具体匹配行内容

## grep 和 egrep的区别
https://blog.51cto.com/mcmvp/1180951
./grep_egrep_fgrep.md

```

### sed的工作模式
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/sed/1.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/sed/2.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/sed/3.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/sed/4.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/sed/5.png)


```shell
# sed(Stream Editor),流编辑器。对标准或文件逐行处理

# sed的选项
sed 'p' sed.txt 文件数据每一行打印两边
sed -n 'p' sed.txt 文件数据只打印一行
sed -n '/python/p' sed.txt 只打印小写pthon
sed -n -e '/python/p' -e '/PYTHON/p' sed.txt 执行两个匹配表达式

sed -n -f edit.sed sed.txt
sed -n -r '/python|PYTHON/p' sed.txt

sed -n 's/love/like/g;p' sed.txt

sed -n -i -r 's/love/like/g;p' sed.txt # 表达式前面加上-r


# sed中的pattern
1、LineNumber                       -- 直接指定行号
    sed -n "17p" /etc/passwd  打印file文件的第17行
2、StartLine，EndLine                   --  指定起始行号和结束行号
    sed -n "10,20p" /etc/passwd   打印file文件的10到20行
3、StartLine，+N                        -- 指定起始行号，然后后面N行
    sed -n "10,+5p" /etc/passwd    打印file文件中从第10行开始，往后加5行的所有
4、/pattern1/                           -- 正则表达式匹配的行
    sed -n "/^root/p" /etc/passwd  打印file文件中以root开头的行
5、/pattern1/,/pattern2/                -- 从匹配到pattern1的行，到匹配到pattern2
    sed -n "/^ftp/,/^mail/p" /etc/passwd  打印file文件中第一个匹配到ftp开头的行
6、LineNumber,/pattern1/                -- 从指定行号开始匹配，知道匹配到pattern1的
    sed -n "4,/^hdfs/p" file            -- 打印file文件中第4行开始匹配，知道匹配到最后也要打印
7、/pattern1/,LineNumber                -- 从pattern匹配的行开始，知道匹配到指定行
    sed -n "/root/,10p" file            -- 打印file文件中匹配root的行，直到第10行结束

# sed中的编辑命令
cp /etc/passwd ./                       -- 把/etc/passwd的文件复制到当前文件夹
sed -i '1d' passwd                      -- 删除文件passwd的第一行
sed -i '1,3d' passwd                    -- 删除文件passwd的第一行到第三行
sed -i '/\/sbin\/nologin/d' passwd      -- 删除文件passwd匹配到的 /sbin/nologin 所在行          
sed -i '/^mail/','/^ftp/d' passwd
sed -i '/\/bin\/bash/a canLogin' passwd -- 符合条件行后添加“canLogin”
sed -i '/^hdfs/,/^yarn/i AAA' passwd    -- 符合条件行前添加“AAA”
sed -i '/root/r list' passwd            -- 符合条件行后添加 list文件中的内容
sed -n '/\/bin\/bash/w /abc.txt' passwd    -- 符合条件的行 被写入abc.txt 文件中 (如果不加-n会输出所有内容)

# 修改
7、 s/pattern/string                    -- 查找并替换，查找符合pattern模式的字符串，将其替换为string 适配(一、二、三、四、五)
 s/pattern/string/g                  --  全局查找并替换，查找符合pattern模式的字符串
 s/pattern/string/2g                 -- 2g表示，同一行内，只替换前2个匹配的，剩下的不替换
 s/pattern/string/ig                 -- 加i参数表示匹配时忽略大小写，g表示匹配到的全部替换

 sed -i 's/root/Root/2g' passwd
 sed -i 's/root/RooT/' passwd
 sed -i 's/HADOOP/hadoop/2' str.txt
 sed -i 's/hadoop/HADOOP/ig' str.txt
 sed -n '/\/sbin\/nologin/=' passwd 只显示行号，不显示内容

# 其他编辑命令
8、=                                    --- 显示行号

# 什么是反向引用？
    &和\1                               引用模式匹配的整个串
    sed "s/1...e/&r/g" file             在file中搜寻以1开头，然后跟两个任意字符，以结尾的字符串
    sed "s/\(1...e\)/\1r/g" file        和上面实现一样的功能，使用\1代表搜寻到的字符串
    上面两种方式实现了一样的功能，分别使用&和\1引用前面匹配到的整个字符串
    两者区别在于&只能表示匹配到的完整字符串，只能引用整个字符串;而\1可以使用()对匹配到的字符串
    例如：如果我们仅想要提黄匹配到的字符串的一部分，name必须使用\1这种方式。
    查找test.txt文件中以1开头，紧接着跟两个任意字符，再接一个e的字符串。将找到的字符串中开头的
    sed "s/1\(...e\)/L\1/g" test.txt

    将hadoop改为hadAAp 
    sed -i 's/had..p/HADOOP/g' str.txt  匹配所有以had开头，以p结尾的全局字符并替换成HADOOP
    sed -i 's/had..p/&s/g' str.txt  匹配所有以had开头，以p结尾的全局字符并替换成 符合条件字符加上s
    sed -i 's/\(had..ps\)/\1o/g'    等价上方表达式

    sed -i 's/\(had\)...../\1doop/g' str.txt    匹配had后面五个任意字符的字符串并将匹配到的这五个字符替换为doop

# sed 中引用变量时注意事项
1）匹配模式中存在变量，则建议使用双引号 exapmle.sh
2）sed中需要引入自定义变量时，如果外面使用单引号，则自定义变量也必须使用单引号

# 利用sed查询特定内容

pattern 种类：
    1、8p
    2、8,10p
    3、8,+5p
    4、/regexp/p
    5、/regexp_1/,/regexp_2/p
    6、8,/reg/p
    7、/reg/,8p

- 1、 打印file第20行内容
sed -n '20p' file
- 2、打印filezhong从第8行开始，到第15行结束的内容
sed -n '8,15p' file
- 3、打印file中从第8行开始，然后+5行的内容
sed -n '8,+5p' file
- 4、打印file中开头匹配hdfs字符串的内容
sed -n '/^hdfs/p' file
- 5、打印file中开头为root的行开始，到开头为hdfs的行结束的内容
sed -n '/^root/,/^hdfs/p' file
- 6、打印file中第8行开始，到含有/sbin/nologin的内容的行结束内容
sed -n '8,/\/sbin\/nologin/p' file
- 7、打印/etc/passwd中第一个包含/bin/bash内容的行开始，到第5行结束的内容
sed -n '/\/bin\/bash/,5p' /etc/passwd
```
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/sed/6.png)
### 脚本编写 
example/sed mysql_process.sh
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/sed/7.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/sed/8.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/sed/9.png)

### 利用sed删除特定内容
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/sed/10.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/sed/11.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/sed/12.png)

### 利用sed修改文件内容
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/sed/13.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/sed/14.png)

### 利用sed追加文件内容
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/sed/15.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/sed/16.png)

```shell


```
