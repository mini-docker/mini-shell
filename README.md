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














