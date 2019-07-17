#!/bin/bash
#

# ftp -i << EOF
#     open 192.168.184.3
#     user ftp_user redhat

#     cd/tmp
#     put 123
#     bye
# EOF

user="dbuser"
password="123456"
host="192.168.184.132"

ftp_user="ftp_user"
ftp_password="redhat"
ftp_host="192.168.184.3"

src_dir="/data01/bak"
dst_dir="/data/backup"

function auto_ftp
{
    ftp -niv << EOF
        open $ftp_host
        user $ftp_user $ftp_password

        cd $dst_dir
        put $1
        bye
EOF
}

auto_ftp aaa

