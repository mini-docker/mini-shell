```
例子:
1. :
格式: grep [option] pattern filename 注意: pattern如果是表达式或者超过两个单词的, 需要用引号引用. 可以是单引号也可双引号, 区别是单引号无法引用变量而双引号可以.

grep '\<Tom\>' file   包含单词Tom的行
grep 'Tom savage' file 包含Tom savage的行
grep '^Tommy' file 包含以Tommy开头的行
grep '\.bak$' file 包含以.bak结束的行
grep '[Pp]yramid' file 包含pyramid 或Pyramid的单词的行
grep '[A-Z]' file 包含至少一个大写字母的行
grep '[0-9]' file 包含至少一个数字的行
grep '[A-Z]...[0-9]' file 包含五个字符,以大写开头, 和一个数字结尾的行.
grep -w '[tT]est' file 包含单词和test的行.
grep -s 'ken sun' file 找到包含ken sun的行, 但不打印行, 而是用来检查退出状态.
grep -v aaa file 打印不包含aaa的行.
grep -i cathy file 打印所有包含cathy的行, 而不考虑大小些.
grep -l 'dear cathy' * 打印包含dear cathy的文件的文件名清单.
grep -n tom file   打印匹配的行并追加行号.
grep "$LOGNAME" file 包含变量内容的行, 注意必须用双引号, 单引号则无法引用变量.
grep '$name' file 打印包含字符$name的行.


2 : egrep = grep -E 可以使用基本的正则表达外, 还可以用扩展表达式. 注意区别.
扩展表达式:
+ 匹配一个或者多个先前的字符, 至少一个先前字符.
? 匹配0个或者多个先前字符.
a|b|c 匹配a或b或c
() 字符组, 如: love(able|ers) 匹配loveable或lovers.
(..)(..)\1\2 模板匹配. \1代表前面第一个模板, \2代第二个括弧里面的模板.
x{m,n} =x\{m,n\} x的字符数量在m到n个之间.

egrep '^+' file   以一个或者多个空格开头的行.
grep '^*' file   同上
egrep '(TOM|DAN) SAVAGE' file 包含 TOM SAVAGE 和DAN SAVAGE的行.
egrep '(ab)+' file 包含至少一个ab的行.
egrep 'x[0-9]?' file 包含x或者x后面跟着0个或者多个数字的行.
egrep 'fun\.$' * 所有文件里面以fun.结尾的行.
egrep '[A-Z]+' file 至少包含一个大写字母的行.
egrep '[0-9]' file 至少一个数字的行.
egrep '[A-Z]...[0-9]' file 有五个字符, 第一个式大写, 最后一个是数字的行.
egrep '[tT]est' file 包含单词test或Test的行.
egrep 'ken sun' file 包含ken sun的行.
egrep -v 'marry' file 不包含marry的行.
egrep -i 'sam' file 不考虑sam的大小写,含有sam的行.
egrep -l "dear ken" * 包含dear ken的所有文件的清单.
egrep -n tom file 包含tom的行, 每行前面追加行号.
egrep -s "$name" file 找到变量名$name的, 不打印而是显示退出状态. 0表示找到. 1表示表达式没找到符合要求的, 2表示文件没找到.

3 fgrep 很简单就是固化表达式的搜索.如:

fgrep "$name...[a-z]" file 就是在file里面找到和字符$name...[a-z]一样的行. 其中$和...等没有转义的意义.
http://hi.baidu.com/sei_zhouyu/item/c18e1a950d2e9eb5cc80e558

 

1. grep简介
grep （global search regular expression_r(RE) and print out the line,全面搜索正则表达式并把行打印出来）是一种强大的文本搜索工具，它能使用正则表达式搜索文本，并把匹配的行打印出来。Unix的grep家族包括grep、egrep和fgrep。egrep和fgrep的命令只跟grep有很小不同。egrep是grep的扩展，支持更多的re元字符， fgrep就是fixed grep或fast grep，它们把所有的字母都看作单词，也就是说，正则表达式中的元字符表示回其自身的字面意义，不再特殊。linux使用GNU版本的grep。它功能更强，可以通过-G、-E、-F命令行选项来使用egrep和fgrep的功能。

grep的工作方式是这样的，它在一个或多个文件中搜索字符串模板。如果模板包括空格，则必须被引用，模板后的所有字符串被看作文件名。搜索的结果被送到屏幕，不影响原文件内容。

grep可用于shell脚本，因为grep通过返回一个状态值来说明搜索的状态，如果模板搜索成功，则返回0，如果搜索不成功，则返回1，如果搜索的文件不存在，则返回2。我们利用这些返回值就可进行一些自动化的文本处理工作。

2. grep正则表达式元字符集（基本集）
^
锚定行的开始 如：'^grep'匹配所有以grep开头的行。

$
锚定行的结束 如：'grep$'匹配所有以grep结尾的行。

.
匹配一个非换行符的字符如：'gr.p'匹配gr后接一个任意字符，然后是p。

*
匹配零个或多个先前字符如：'*grep'匹配所有一个或多个空格后紧跟grep的行。 .*一起用代表任意字符。

[]
匹配一个指定范围内的字符，如'[Gg]rep'匹配Grep和grep。

[^]
匹配一个不在指定范围内的字符，如：'[^A-FH-Z]rep'匹配不包含A-R和T-Z的一个字母开头，紧跟rep的行。

\(..\)
标记匹配字符，如'\(love\)'，love被标记为1。

\<
锚定单词的开始，如:'\<grep'匹配包含以grep开头的单词的行。

\>
锚定单词的结束，如'grep\>'匹配包含以grep结尾的单词的行。

x\{m\}
重复字符x，m次，如：'0\{5\}'匹配包含5个o的行。

x\{m,\}
重复字符x,至少m次，如：'o\{5,\}'匹配至少有5个o的行。

x\{m,n\}
重复字符x，至少m次，不多于n次，如：'o\{5,10\}'匹配5--10个o的行。

\w
匹配文字和数字字符，也就是[A-Za-z0-9]，如：'G\w*p'匹配以G后跟零个或多个文字或数字字符，然后是p。

\W
\w的反置形式，匹配一个或多个非单词字符，如点号句号等。

\b
单词锁定符，如: '\bgrep\b'只匹配grep。

3. 用于egrep和 grep -E的元字符扩展集
+
匹配一个或多个先前的字符。如：'[a-z]+able'，匹配一个或多个小写字母后跟able的串，如loveable,enable,disable等。

?
匹配零个或多个先前的字符。如：'gr?p'匹配gr后跟一个或没有字符，然后是p的行。

a|b|c
匹配a或b或c。如：grep|sed匹配grep或sed

()
分组符号，如：love(able|rs)ov+匹配loveable或lovers，匹配一个或多个ov。

x{m},x{m,},x{m,n}
作用同x\{m\},x\{m,\},x\{m,n\}

4. POSIX字符类
为了在不同国家的字符编码中保持一至，POSIX(The Portable Operating System Interface)增加了特殊的字符类，如[:alnum:]是A-Za-z0-9的另一个写法。要把它们放到[]号内才能成为正则表达式，如[A- Za-z0-9]或[[:alnum:]]。在linux下的grep除fgrep外，都支持POSIX的字符类。

[:alnum:]
文字数字字符

[:alpha:]
文字字符

[:digit:]
数字字符

[:graph:]
非空字符（非空格、控制字符）

[:lower:]
小写字符

[:cntrl:]
控制字符

[:print:]
非空字符（包括空格）

[:punct:]
标点符号

[:space:]
所有空白字符（新行，空格，制表符）

[:upper:]
大写字符

[:xdigit:]
十六进制数字（0-9，a-f，A-F）

5. Grep命令选项
-?
同时显示匹配行上下的？行，如：grep -2 pattern filename同时显示匹配行的上下2行。

-b，--byte-offset
打印匹配行前面打印该行所在的块号码。

-c,--count
只打印匹配的行数，不显示匹配的内容。

-f File，--file=File
从文件中提取模板。空文件中包含0个模板，所以什么都不匹配。

-h，--no-filename
当搜索多个文件时，不显示匹配文件名前缀。

-i，--ignore-case
忽略大小写差别。

-q，--quiet
取消显示，只返回退出状态。0则表示找到了匹配的行。

-l，--files-with-matches
打印匹配模板的文件清单。

-L，--files-without-match
打印不匹配模板的文件清单。

-n，--line-number
在匹配的行前面打印行号。

-s，--silent
不显示关于不存在或者无法读取文件的错误信息。

-v，--revert-match
反检索，只显示不匹配的行。

-w，--word-regexp
如果被\<和\>引用，就把表达式做为一个单词搜索。

-V，--version
显示软件版本信息。

6. 实例
要用好grep这个工具，其实就是要写好正则表达式，所以这里不对grep的所有功能进行实例讲解，只列几个例子，讲解一个正则表达式的写法。

$ ls -l | grep '^a'
通过管道过滤ls -l输出的内容，只显示以a开头的行。

$ grep 'test' d*
显示所有以d开头的文件中包含test的行。

$ grep 'test' aa bb cc
显示在aa，bb，cc文件中匹配test的行。

$ grep '[a-z]\{5\}' aa
显示所有包含每个字符串至少有5个连续小写字符的字符串的行。

$ grep 'w\(es\)t.*\1' aa
如果west被匹配，则es就被存储到内存中，并标记为1，然后搜索任意个字符（.*），这些字符后面紧跟着另外一个es（\1），找到就显示该行。如果用egrep或grep -E，就不用"\"号进行转义，直接写成'w(es)t.*\1'就可以了。

1、参数：
-I ：忽略大小写
-c ：打印匹配的行数
-l ：从多个文件中查找包含匹配项
-v ：查找不包含匹配项的行
-n：打印包含匹配项的行和行标

2、RE（正则表达式）
\ 忽略正则表达式中特殊字符的原有含义
^ 匹配正则表达式的开始行
$ 匹配正则表达式的结束行
\< 从匹配正则表达式的行开始
\> 到匹配正则表达式的行结束
[ ] 单个字符；如[A] 即A符合要求
[ - ] 范围 ；如[A-Z]即A，B，C一直到Z都符合要求
. 所有的单个字符
* 所有字符，长度可以为0

3、举例
# ps -ef | grep in.telnetd
root 19955 181 0 13:43:53 ? 0:00 in.telnetd

# more size.txt size文件的内容
b124230
b034325
a081016
m7187998
m7282064
a022021
a061048
m9324822
b103303
a013386
b044525
m8987131
B081016
M45678
B103303
BADc2345

# more size.txt | grep '[a-b]' 范围 ；如[A-Z]即A，B，C一直到Z都符合要求
b124230
b034325
a081016
a022021
a061048
b103303
a013386
b044525
# more size.txt | grep '[a-b]'*
b124230
b034325
a081016
m7187998
m7282064
a022021
a061048
m9324822
b103303
a013386
b044525
m8987131
B081016
M45678
B103303
BADc2345

# more size.txt | grep '[b]' 单个字符；如[A] 即A符合要求
b124230
b034325
b103303
b044525
# more size.txt | grep '[bB]'
b124230
b034325
b103303
b044525
B081016
B103303
BADc2345

# grep 'root' /etc/group
root::0:root
bin::2:root,bin,daemon
sys::3:root,bin,sys,adm
adm::4:root,adm,daemon
uucp::5:root,uucp
mail::6:root
tty::7:root,tty,adm
lp::8:root,lp,adm
nuucp::9:root,nuucp
daemon::12:root,daemon

# grep '^root' /etc/group 匹配正则表达式的开始行
root::0:root


# grep 'uucp' /etc/group
uucp::5:root,uucp
nuucp::9:root,nuucp

# grep '\<uucp' /etc/group
uucp::5:root,uucp


# grep 'root$' /etc/group 匹配正则表达式的结束行
root::0:root
mail::6:root


# more size.txt | grep -i 'b1..*3' -i ：忽略大小写

b124230
b103303
B103303

# more size.txt | grep -iv 'b1..*3' -v ：查找不包含匹配项的行

b034325
a081016
m7187998
m7282064
a022021
a061048
m9324822
a013386
b044525
m8987131
B081016
M45678
BADc2345

# more size.txt | grep -in 'b1..*3'
1:b124230
9:b103303
15:B103303

# grep '$' /etc/init.d/nfs.server | wc -l
128
# grep '\$' /etc/init.d/nfs.server | wc –l 忽略正则表达式中特殊字符的原有含义

15
# grep '\$' /etc/init.d/nfs.server
case "$1" in
>/tmp/sharetab.$$
[ "x$fstype" != xnfs ] && 
echo "$path\t$res\t$fstype\t$opts\t$desc" 
>>/tmp/sharetab.$$
/usr/bin/touch -r /etc/dfs/sharetab /tmp/sharetab.$$
/usr/bin/mv -f /tmp/sharetab.$$ /etc/dfs/sharetab
if [ -f /etc/dfs/dfstab ] && /usr/bin/egrep -v '^[ ]*(#|$)' 
if [ $startnfsd -eq 0 -a -f /etc/rmmount.conf ] && 
if [ $startnfsd -ne 0 ]; then
elif [ ! -n "$_INIT_RUN_LEVEL" ]; then
while [ $wtime -gt 0 ]; do
wtime=`expr $wtime - 1`
if [ $wtime -eq 0 ]; then
echo "Usage: $0 { start | stop }"


# more size.txt

the test file
their are files
The end

# grep 'the' size.txt
the test file
their are files

# grep '\<the' size.txt
the test file
their are files

# grep 'the\>' size.txt
the test file

# grep '\<the\>' size.txt
the test file

# grep '\<[Tt]he\>' size.txt
the test file
The end

http://blog.sina.com.cn/s/blog_4e7cf89d01000c49.html

 

 

 

 

 

 

 

 

linux基本命令grep egrep fgrep用法以及正则表达式 

 

一、grep、egrep、fgrep命令 
  本文中主要介绍了linux系统下grep egrep fgrep命令和正则表达式的基本参数和使用格式、方法。（注释：文中fg代表例子，） 

1.1、基本定义： 
        grep（global search regular RE ) and print out the line,全面搜索正则表达式并把行打印出来）是一种强大的文本搜索工具，它只能使用基本的正则表达式来搜索文本，并把匹配的行打印出来。

    grep是很常见也很常用的命令，它的主要功能是进行字符串数据的比较，然后符合用户需求的字符串打印出来，但是主意，grep在数据中查找一个字符串时，是以“整行”为单位进行数据筛选的。 

    egrep命令等同于grep -E，利用此命令可以使用扩展的正则表达式对文本进行搜索，并把符合用户需求的字符串打印出来。 

    fgrep命令等同于grep -F，它利用固定的字符串来对文本进行搜索，但不支持正则表达式的引用，所以此命令的执行速度也最快。

1.2、命令基本用法 
     grep [option] '搜索字符串' filename 

      grep常用选项： 

          -a :在二进制文件中，以文本文件的方式搜索数据 

          -c :计算找到'搜索字符串'的次数 

          -i :忽略大小写 

          -v :反向查找，即显示没有'搜索字符串'内容的那行 

          -o :只显示被模式匹配的字符串 

          -n :输出行号 

          --colour（color）:颜色显示 

 

          -A：显示匹配到字符那行的后面n行 

          -B：显示匹配到字符那行的前面n行 

          -C：显示匹配到字符那行的前后n行 

 

二、正则表达式 
2.1、基本定义： 
     正则表达使用单个字符串来描述、匹配一系列符合某个句法规则的字符串。在很多文本编辑器里，正则表达式通常被用来检索、替换那些符合某个模式的文本。简而言之，正则表达式就是处理字符串的方法，以行为单位进行字符串的处理，通过一些特殊符号的辅助，可以让用户轻松搜索/替换某特定的字符串。

     正则表达式分为两类：基本的正则表达式和扩展的正则表达式。 

2.2、正则表达式详细介绍 
  2.2.1、基本的正则表达式： 
      （1）元字符： 

           . :匹配任意单个字符 

             fg：查找包含student且student后面带一个字符的行 

             grep ‘student.’ /etc/passwd （模式可以用单引号和双引号，如果模式中要做变量替换时则必须用双引）      

           [] :匹配指定范围内的任意单个字符,[abc],[a-z],[0-9],[a-zA-Z] 

               fg：查找带有数字的行 

               grep ‘[0-9]’ /etc/passwd 

           [^] :匹配指定范围外的任意单个字符 

                fg：查找没有小写字母的行。 

                grep ‘[^a-z]’ /etc/inittab 

           [:space:]:表示空白字符 

           [:punct:]:表示所有标点符号的集合 

           [:lower:]:表示所有的小写字母 

           [:upper:]:表示所有的大写字母 

           [:alpha:]:表示大小写字母 

           [:digit:]:表示数子 

           [:alnum:]:表示数字和大小写字母-----使用格式[[:alnum:]]等 

      （2）次数匹配： 

           *  :匹配其前面的字符任意次 

               fg：查找root出现0次或0次以上的行 

             grep ‘root*’ /etc/passwd 
            .* :任意字符  

                fg：查找包含root的行 

            grep 'root.*' /etc/passwd 
            \?：匹配其前面的字符1次或0次 

            \{m,n\} :匹配其前字符最少m，最多n次） 

        (3) 字符锚定： 

            ^:锚定行首，此字符后面的任意内容必须出现在行首 

                fg：查找行首以#开头的行 

                grep '^#' /etc/inittab 
            $:锚定行尾，此字符前面的任意内容必须出现在行尾 

                fg：查找行首以root结尾的行 

                grep 'root$' /etc/inittab   

            ^$:锚定空白行，可以统计空白行 

            \<或者\b:锚定词首，其后面的任意字符必须做为单词首部出现 

               fg:查找root且root前面不包含任何字符的行 

                 grep '\<root' /etc/man.config 
            \>或者\b:锚定词尾，其前面的任意字符必须做为单词尾部出现                         fg：\<root\> 查找root单词  grep "\<root\>" =grep "\broot\b" 

 2.2.2、扩展的正则表达式： 
         扩展的正则表达只是在基本的正则表达上作出了小小的一点修改，其修改如下： 

 在扩展的正则表达中把\( \) 写成()、\{ \} 写成{ }，另外加入了+：次数匹配，匹配其前面的字符至少出现一次，无上限、|: 或者(二取一），其余的都一样， 基本正则表达式，使用( ) { } . ? |都需要转义,在扩展正则表达中不需要加\，其详细信息如下： 

         (1) 字符匹配的命令和用法与基本正则表达式的用法相同，这里不再重复阐述。 

         (2) 次数匹配： 

             * :匹配其前面字符的任意次 

             ？:匹配其前面字符的0此或着1此 

             + :匹配其前面字符至少1此 

                  fg：至少一个空白符： '[[:space:]]+' 

             {m,n} :匹配其前面字符m到n次 

          (3) 字符锚定的用法和基本正则表达式的用法相同，在此不再阐述。 

         （4）特殊字符： 

               | : 代表或者的意思。 

                    fg：grep -E 'c|cat' file：表示在文件file内查找包含c或者cat 

                \.:\表示转义字符，此表示符号. 

三、grep命令利用小实例 
(1)显示/etc/inittab 中以#开头，且后面跟一个或者多个空白符，而后又跟了任意非空白符的行 

grep '#[[:space:]]*[^[:space:]]' /etc/inittab 

(2) 输出不是数字开关的行grep '^[^0-9]' 

/etc/passwd 

(3)输出行首是1或2 

grep '^\(1\|2\)' /etc/inittab 
或 
grep -E '^(1|2)' /etc/inittab 
(4)查找前面是rc中间接任意字符而后跟/rc 
grep '.*\(rc\).*\/\1.*' /etc/inittab 
(5）取出当前电脑上的IP 
ifconfig |grep -A 1 "^eth0" |grep "\<[0-9.]\{1,\} |cut -d: -f2 
(6)查找当前系统上名字为student（必须出现在行首）的用户账户的相关信息，文件为/etc/passwd 
grep "^student" /etc/passwd
http://blog.chinaunix.net/uid-28584525-id-3510819.html
```