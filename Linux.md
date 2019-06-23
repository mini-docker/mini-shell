### Linux查看目录结构的命令
- ls 列出目录的内容，参数-a列出目录下的所有文件，包括开头隐藏的文件，-l显示文件的详细信息，-lh显示文件的大小;如`ls -lh /ls -a/ls -h/ls -s/ls -lsa`
- cd 切换工作目录
- pwd 显示当前工作目录的绝对路径

### Linux安装目录详解
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/001.png)

### Linux系统的常用命令
- windwos相关可用Xmanager工具等
#### 1,开关机
- halt 立刻关机
- poweroff 立刻关机
- shutdown -h now 立刻关机(root用户使用)
- shutdown -h 10 10分钟后自动关机
- 如果是通过shutdown命令设置关机的话，可以用shutdown -c命令取消重启
- Linux系统重启命令 reboot
- shutdown -r now 立刻重启
- shutdown -r 10 10分钟后自动重启
- shutdown -r 20:35 在时间为指定时间重启
- 如果是通过shutdown命令设置重启的话，可以用shutdown -c命令取消重启

#### 2，系统信息与进程类命令
- top 查看系统CPU、内存等使用情况
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/1.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/2.png)

#### 3，系统服务管理
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/3.png)

#### 4，网络相关配置文件
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/4.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/5.png)

#### 5，Linux用户权限介绍
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/6.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/7.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/8.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/9.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/9-1.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/10.png)
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/11.png)
-  su 用来切换登录的用户
- sudo 如果系统管理员saxx不想其他的普通用户知道root密码，而又希望其他用户能够拥有root用户部分或全部权限。最好的选择方式就是使用sudo

#### 6，shell相关
echo
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/12.png)

Ctrl
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/13.png)

shell重定向
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/14.png)

shell通配符
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/15.png)

shell管道符
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/16.png)

变量参数
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/17.png)


#### 7，正则表达式与通配符的区别
- 通配符(*?[])用来匹配符合条件的文件名，是完全匹配。ls、find、cp这些命令不支持正则表达式，支持通配符匹配
- 正则表达式用来匹配在文件中的字符串，是包含匹配。grep awk sed等命令支持正则表达式
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/18.png)

- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/19.png)

printf常用转义符
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/20.png)

sed常用命令
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/21.png)

sort常用命令
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/22.png)

wc常用命令
- ![流程图](https://github.com/mini-docker/mini-shell/blob/master/img/mysql/23.png)




