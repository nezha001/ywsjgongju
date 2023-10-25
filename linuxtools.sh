#!/bin/bash

# check root
[[ $EUID -ne 0 ]] && echo -e "${red}错误：${plain} 必须使用root用户运行此脚本！\n" && exit 1
# check os
if [[ -f /etc/redhat-release ]]; then
    release="centos"
    bash <(curl -k https://raw.githubusercontent.com/nezha001/ywsjgongju/main/gongju.sh)
elif cat /etc/issue | grep -Eqi "debian"; then
    release="debian"
   bash <(curl -k  https://raw.githubusercontent.com/nezha001/ywsjgongju/main/linux-ubuntu.sh)
elif cat /etc/issue | grep -Eqi "ubuntu"; then
    release="ubuntu"
    bash <(curl -k  https://raw.githubusercontent.com/nezha001/ywsjgongju/main/linux-ubuntu.sh)
elif cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
    bash <(curl -k https://raw.githubusercontent.com/nezha001/ywsjgongju/main/gongju.sh)
elif cat /proc/version | grep -Eqi "debian"; then
    release="debian"
    bash <(curl -k  https://raw.githubusercontent.com/nezha001/ywsjgongju/main/linux-ubuntu.sh)
elif cat /proc/version | grep -Eqi "ubuntu"; then
    release="ubuntu"
    bash <(curl -k  https://raw.githubusercontent.com/nezha001/ywsjgongju/main/linux-ubuntu.sh)
elif cat /proc/version | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
    bash <(curl -k https://raw.githubusercontent.com/nezha001/ywsjgongju/main/gongju.sh)
else
    echo -e "${red}未检测到系统版本，请联系脚本作者！运维世界www.ywsj.cf${plain}\n" && exit 1
fi
