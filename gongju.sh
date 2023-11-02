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
# check root
[[ $EUID -ne 0 ]] && echo -e "${red}错误：${plain} 必须使用root用户运行此脚本！\n" && exit 1
# check os
if [[ -f /etc/redhat-release ]]; then
    release="centos"
elif cat /etc/issue | grep -Eqi "debian"; then
    release="debian"
elif cat /etc/issue | grep -Eqi "ubuntu"; then
    release="ubuntu"
elif cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
elif cat /proc/version | grep -Eqi "debian"; then
    release="debian"
elif cat /proc/version | grep -Eqi "ubuntu"; then
    release="ubuntu"
elif cat /proc/version | grep -Eqi "centos|red hat|redhat"; then
    release="centos"
else
    echo -e "${red}未检测到系统版本，请联系脚本作者！${plain}\n" && exit 1
fi
arch=$(arch)
# 获取IP地址及其信息
IP4=$(curl -s4m8 https://ip.gs/json)
IP6=$(curl -s6m8 https://ip.gs/json)
WAN4=$(expr "$IP4" : '.*ip\":\"\([^"]*\).*')
WAN6=$(expr "$IP6" : '.*ip\":\"\([^"]*\).*')
COUNTRY4=$(expr "$IP4" : '.*country\":\"\([^"]*\).*')
COUNTRY6=$(expr "$IP6" : '.*country\":\"\([^"]*\).*')
ASNORG4=$(expr "$IP4" : '.*asn_org\":\"\([^"]*\).*')
ASNORG6=$(expr "$IP6" : '.*asn_org\":\"\([^"]*\).*')
# 判断IP地址状态
IP4="$WAN4 （$COUNTRY4 $ASNORG4）"
IP6="$WAN6 （$COUNTRY6 $ASNORG6）"
if [ -z $WAN4 ]; then
	IP4="当前VPS未检测到IPv4地址"
fi
if [ -z $WAN6 ]; then
	IP6="当前VPS未检测到IPv6地址"
fi
#安装青龙面板函数
qlPanel() {
rm -rf ./installqinglong.sh &&yum -y install wget && wget https://raw.githubusercontent.com/nezha001/ywsjgongju/main/installqinglong.sh && chmod 777 ./installqinglong.sh && ./installqinglong.sh
}
#安装xui脚本
xuiinstall() {
    bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)
}
#安装wget,git,bash-completion,net-tools
installgongj() {
    yum -y install wget git bash-completion net-tools curl make jq vim lrzsz
    bash <(curl -Ls https://raw.githubusercontent.com/nezha001/ywsjgongju/main/gongju.sh)
}
#查看本机ipv4公网IP
chaipv4() {
    myipv4=$(curl ifconfig.me)
echo "***************************************"
red "$HOSTNAME你好,你的ipv4公网IP是:$myipv4"
echo "***************************************"
}
#测网速
cewangsu() {
    yum -y install git && git clone https://github.com/sivel/speedtest-cli.git && cd ./speedtest-cli/ && ./speedtest.py && cd ..
}
#安装docker与docker-compose
installdocker() {
   rm -rf ./centos7installdocker.sh ; yum -y install wget && wget https://raw.githubusercontent.com/nezha001/ywsjgongju/main/centos7installdocker.sh && chmod 777 ./centos7installdocker.sh && ./centos7installdocker.sh ; rm -rf ./centos7installdocker.sh
    yellow "docker与docker-compose安装成功"
}
#安装宝塔国际板
installbt() {
    yum install -y wget && wget -O install.sh http://www.aapanel.com/script/install_6.0_en.sh && bash install.sh aapanel
}
#安装BBR加速
installbbr() {
    cd /usr/src && wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
}
#更改root用户密码为www.yyzq.cf，开放ssh远程访问
installssh() {
     bash <(curl -Ls https://raw.githubusercontent.com/nezha001/ywsjgongju/main/centos7tossh.sh)
}
#进入云大师
intoyun() {
    rm -rf ./yundashi.sh && yum -y install wget && wget https://raw.githubusercontent.com/nezha001/ywsjgongju/main/yundashi.sh && chmod 777 ./yundashi.sh && bash ./yundashi.sh ; rm -rf ./yundashi.sh
}
#安装frp内网穿透
installfrp() {
    wget https://code.aliyun.com/MvsCode/frps-onekey/raw/master/install-frps.sh -O ./install-frps.sh
chmod 700 ./install-frps.sh
./install-frps.sh install
rm -rf ./install-frps.sh
} 
# 哪吒面板
nezha() {
    curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && ./nezha.sh
}
#port端口
portone() {
 rm -rf ./portone.sh && yum -y install wget && wget https://raw.githubusercontent.com/nezha001/ywsjgongju/main/portone.sh && chmod 777 ./portone.sh && bash ./portone.sh
}
installmysql() {
    yum -y install wget 
    rm -rf installmysql.sh
    bash <(curl -Ls https://raw.githubusercontent.com/nezha001/ywsjgongju/main/installmysql.sh)
    rm -rf installmysql.sh
}
#centos一键安装umami
installumami() {
    rm -rf ./installumami.sh && yum -y install wget && wget https://raw.githubusercontent.com/nezha001/ywsjgongju/main/installumami.sh && chmod 777 ./installumami.sh && ./installumami.sh
}
#安装bench
bench() {
yum -y install wget && wget -qO- bench.sh | bash
}
#ping工具
ping() {
  rm -rf ./ping.sh &&  yum -y install wget && wget https://raw.githubusercontent.com/nezha001/ywsjgongju/main/ping.sh && chmod 777 ./ping.sh && ./ping.sh
}
#安装openvpn
installopenvpn() {
rm -rf ./openvpn.sh && yum -y install wget && wget https://raw.githubusercontent.com/nezha001/ywsjgongju/main/openvpn.sh && chmod 777 ./openvpn.sh && ./openvpn.sh 
rm -rf ./openvpn.sh
rm -rf ./openvpn
}
#一键安装Acme 脚本
installacme() {
    yum -y install openssl socat && curl https://get.acme.sh | sh
}
#一键安装aria2
installaria2(){
    yum -y install wget curl ca-certificates && wget -N git.io/aria2.sh && chmod +x aria2.sh && ./aria2.sh
}
#一键安装nmap工具
installnmap() {
  yum -y install wget
  wget https://github.com/nezha001/ywsjgongju/raw/main/nmap-7.92-1.x86_64.rpm
  if [ $? -ne 0 ]; then
    red "下载nmap失败"
    exit 1
  fi

  rpm -vhU nmap-7.92-1.x86_64.rpm
  if [ $? -ne 0 ]; then
    red "安装nmap失败"
    exit 1
  else
    green "恭喜你，nmap已经安装成功"
  fi

  rm -f nmap-7.92-1.x86_64.rpm
}
#巡检服务器
xunjian() {
   rm -rf ./runxujian.sh ; yum -y install wget ; wget https://raw.githubusercontent.com/nezha001/ywsjgongju/main/runxujian.sh ; chmod +x runxujian.sh ; ./runxujian.sh ; rm -rf ./runxujian.sh
}
#查看占用内存排名前10的应用
chakan_mem() {
ps aux --sort=-%mem | head -n 11
}

#VPS推流直播脚本
24live (){
    bash <(curl https://alist.ywsj.cf/d/Cloudreve/shell/live/24live.sh)
}
# 查快递
query_delivery () {
 bash <(curl https://raw.githubusercontent.com/nezha001/ywsjgongju/main/query_delivery.sh)
}
mylinux=$(cat /etc/redhat-release)
#内存使用率
my_mem=$(free | awk '/^Mem:/{print $3/$2 * 100.0 "%"}')
#/home磁盘使用率
my_home=$(df -h /home | awk 'NR==2{print $5}')
#cpu平均使用率
my_cpu=$(top -bn1 | awk '/^%Cpu/{print $2+$4}')%
echo -e "
 =====================================================
 \033[33m欢迎使用《有云工具大师》
 欢迎$HOSTNAME的到来
 当前登录用户:$USER
 现在的时间是:$(date)
 当前所在位置是:$PWD
 当前系统是:$mylinux
 当前内存使用率是:$my_mem
 当前/home磁盘使用率是:$my_home
 当前CPU平均使用率是:$my_cpu
 本脚本作者:有云转晴
 运维世界: https://www.ywsj.cf 
 有云转晴: https://www.yyzq.cf 
 有云导航: https://hao123.yyzq.cf 
 版本号:6.6.0
 编写日期:20231101\033[0m
 =====================================================" 
 echo -e "\033[32m1.安装 wget git bash-completion net-tools curl make jq vim lrzsz工具
2.查看本机ipv4公网IP
3.测网速
4.安装docker与docker-compose
5.安装宝塔国际版(免手机号验证)
6.安装BBR加速
7.XUI一键脚本安装
8.更改root用户密码并开放ssh远程访问(自己注意风险)
9.进入云大师
10.安装青龙面板
11.安装frp内网穿透
12.安装哪吒面板
13.检查/开启/关闭指定端口
14.centos安装mysql
15.centos一键安装umami网站统计工具
16.服务器检测
17.ping工具
18.一键安装Acme 脚本
19.一键安装aria2
20.一键安装nmap工具
21.巡检服务器
22.查看占用内存排名前10的应用
23.VPS推流直播脚本
24.查快递
0.退出脚本\033[0m
======================================================"
rm -rf ./gongju.sh.*
rm -rf ./speedtest-cli
read -p  " 请输入以上数字[0-23]查看系统相应信息: " num 
if [  $num  == 1  ] ; then
installgongj
elif [  $num  == 2  ]; then
chaipv4
elif [  $num  == 3  ]; then
cewangsu
elif [  $num  == 4  ]; then
installdocker
elif [  $num  == 5 ]; then
installbt
elif [  $num  == 6 ]; then
installbbr
elif [  $num  == 7 ]; then
xuiinstall
elif [  $num  == 8 ]; then
installssh
elif [  $num  == 9 ]; then
intoyun
elif [  $num  == 10 ]; then
qlPanel
elif [  $num  == 11 ]; then
installfrp
elif [  $num  == 12 ]; then
nezha
elif [  $num  == 13 ]; then
portone
elif [  $num  == 14 ]; then
installmysql
elif [  $num  == 15 ]; then
installumami
elif [  $num  == 16 ]; then
bench
elif [  $num  == 17 ]; then
ping
#elif [  $num  == 18 ]; then
#installopenvpn
elif [  $num  == 18 ]; then
installacme
elif [  $num  == 19 ]; then
installaria2
elif [  $num  == 20 ]; then
installnmap
elif [  $num  == 21 ]; then
xunjian
elif [  $num  == 22 ]; then
chakan_mem
elif [  $num  == 23 ]; then
24live
elif [  $num  == 24 ]; then
query_delivery
elif [  $num  == 0  ]; then
red " 我们下次再见，拜拜"
red " 欢迎访问运维世界"
red " https://www.ywsj.cf"
exit
else
red "兄弟：请输入以上数字[0-23]: " 
yellow "兄弟：请输入以上数字[0-23]: " 
green "兄弟：请输入以上数字[0-23]: " 
fi
bash <(curl -Ls https://raw.githubusercontent.com/nezha001/ywsjgongju/main/gongju.sh)

