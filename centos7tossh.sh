#!/bin/bash

# 修改SSH配置文件
sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

# 提示用户设置密码
read -p "请输入新的root密码: " root_password
echo "root:$root_password" | chpasswd

# 重启SSH服务
systemctl restart sshd

# 定义颜色
green() {
  echo -e "\033[32m\033[01m$1\033[0m"
}
yellow() {
  echo -e "\033[33m\033[01m$1\033[0m"
}
red() {
	echo -e "\033[31m\033[01m$1\033[0m"
}
myip=$(curl ifconfig.me)
green "你的ip为:$myip"
yellow "root密码已经设置，请确保记住它并定期更改密码。"
rm -rf centos7tossh.sh
