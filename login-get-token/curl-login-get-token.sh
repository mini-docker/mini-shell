#!/bin/bash

#利用curl请求各种接口 ，最终获取token ，js103 a123456

# https://blog.csdn.net/hmxiao_1983/article/details/20041613
# curl -d "r=0.43154361615275017&action=login&username=js103&password=a123456&vlcodes=5094" https://www.pktest.me
# 请求格式换成formdata
# curl -F "r=0.43154361615275017&action=login&username=js103&password=a123456&vlcodes=5094" https://www.pktest.me
# $("#rmNum").focus();
# var src = $("#vImg").attr("src");
# var imgurl = "https://www.pktest.me" + src;
# sh curl-login-get-token.sh 0.42154361615275017 验证码

# $("#bx_buton_jump").click()
# $(".btn_001").eq(1).click()
curl -d "r=$1&action=login&username=js103&password=a123456&vlcodes=$2" https://www.pktest.me?r=$1&action=login&username=js103&password=a123456&vlcodes=$2 
# curl -d "r=0.42154361615275222&action=login&username=js103&password=a123456&vlcodes=3310" https://www.pktest.me?r=0.42154361615275222&action=login&username=js103&password=a123456&vlcodes=3310 
 

