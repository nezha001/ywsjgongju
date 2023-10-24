#/bin/bash
sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
echo www.yyzq.cf|passwd --stdin root
systemctl restart sshd
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
myip=$(curl ifconfig.me)
green "你的ip为:$myip"
yellow "恭喜你的root密码已经设置成www.yyzq.cf,请及时修改"
rm -rf ./centos7tossh.sh

