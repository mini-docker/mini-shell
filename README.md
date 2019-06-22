# mini-shell
mini-shell

### 注意
- 在mac环境下变量赋值不能加空格

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


