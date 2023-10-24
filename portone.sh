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
read -p "请输入要查看的端口号:" port33
firewall-cmd --query-port=$port33/tcp --zone=public
systemctl restart firewalld
read -p "请输入要开启的端口号:" port34
firewall-cmd --zone=public --add-port=$port34/tcp --permanent
systemctl restart firewalld
read -p "请输入要关闭的端口号:" port35
firewall-cmd --zone=public--remove-port=$port35/tcp --permanent
systemctl restart firewalld
