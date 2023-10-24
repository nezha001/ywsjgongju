#!/bin/bash

# check root
[[ $EUID -ne 0 ]] && echo -e "${red}错误：${plain} 必须使用root用户运行此脚本！\n" && exit 1
# check os
if [[ -f /etc/redhat-release ]]; then
    release="centos"
    bash <(curl -k https://github.com/nezha001/ywsjgongju/blob/main/gongju.sh)
elif cat /etc/issue | grep -Eqi "debian"; then
    release="debian"
   bash <(curl -k  https://alist.ywsj.cf/d/Cloudreve/shell/ubuntu/linux-ubuntu.sh)
elif cat /etc/issue | grep -Eqi "ubuntu"; then
    release="ubuntu"
    bash <(curl -k  https://alist.ywsj.cf/d/Cloudreve/shell/ubuntu/linux-ubuntu.sh)
elif cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
    bash <(curl -k https://alist.ywsj.cf/d/share/sh/gongju.sh?sign=WrOJROwX3jpyVkLPwzBWrvIZnA-rmcLKuljqP3wYNw0=:0)
elif cat /proc/version | grep -Eqi "debian"; then
    release="debian"
    bash <(curl -k  https://alist.ywsj.cf/d/Cloudreve/shell/ubuntu/linux-ubuntu.sh)
elif cat /proc/version | grep -Eqi "ubuntu"; then
    release="ubuntu"
    bash <(curl -k  https://alist.ywsj.cf/d/Cloudreve/shell/ubuntu/linux-ubuntu.sh)
elif cat /proc/version | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
    bash <(curl -k https://alist.ywsj.cf/d/share/sh/gongju.sh?sign=WrOJROwX3jpyVkLPwzBWrvIZnA-rmcLKuljqP3wYNw0=:0)
else
    echo -e "${red}未检测到系统版本，请联系脚本作者！运维世界www.ywsj.cf${plain}\n" && exit 1
fi
