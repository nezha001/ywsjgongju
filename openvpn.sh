#!/bin/bash
#定义颜色
green() {
	echo -e "\033[32m\033[01m$1\033[0m"
}
red() {
	echo -e "\033[31m\033[01m$1\033[0m"
}
yellow() {
	echo -e "\033[33m\033[01m$1\033[0m"
}
read -p "请输入用户名(英文)如hk_yyzq：" NAM
yum install lrzsz -y
mkdir -p ~/openvpn && cd ~/openvpn
yum -y install wget && wget https://alist.yyzq.cf/d/%20%E6%9C%AC%E5%9C%B0%E7%BD%91%E7%9B%98/sh/openvpn-install.sh && chmod 777 ./openvpn-install.sh && ./openvpn-install.sh $NAM
red "恭喜你openVPN安装成功"
red "你的用户名是$NAM"
green "请进入~/ov/目录查看配置文件"
yellow "可以使用sz *.ovpn进行下载"
