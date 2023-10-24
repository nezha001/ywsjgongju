#/bin/bash
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
my1ipv4=$(curl ifconfig.me)
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo    
sudo yum-config-manager --enable docker-ce-nightly
sudo yum install docker-ce docker-ce-cli containerd.io
systemctl start docker  #启动容器
systemctl enable docker #开机自启
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker --version
docker-compose --version
red "恭喜docker与docker-compose安装成功"
yellow "开始安装青龙面板......."
yellow "开启5700端口"
firewall-cmd --zone=public --add-port=5700/tcp --permanent
systemctl restart firewalld
mkdir ./qinglong && cd ./qinglong
wget https://raw.githubusercontent.com/whyour/qinglong/master/docker/docker-compose.yml
yellow "启动青龙面板loading...."
docker-compose up -d
cd ..
green "==================================
恭喜$HOSTNAME青龙面板安装成功
请等待大约1-3分钟访问以下地址进入安装界面
========================================="
green "IPv4访问地址为：http://$my1ipv4:5700"








