#!/bin/bash
# 查看操作系统版本信息
mylinux=$(lsb_release -s -d | awk '{print $1,$2,$3}')
# 查看内核版本信息
kern=$(uname -r)
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
#内存使用率
my_mem=$(free | awk '/^Mem:/{print $3/$2 * 100.0 "%"}')
#/home磁盘使用率
my_home=$(df -h /home | awk 'NR==2{print $5}')
#cpu平均使用率
my_cpu=$(top -bn1 | awk '/^%Cpu/{print $2+$4}')%

#cpu安装wget,git,bash-completion,net-tools,curl,make
installgongj(){
        apt-get -y install wget git bash-completion net-tools curl make
}

#2.查看本机ipv4公网IP
chaipv4(){
    myipv4=$(curl ip.sb)
echo "***************************************"
red "$HOSTNAME你好,你的ipv4公网IP是:$myipv4"
echo "***************************************"
}

#3.测网速
cewangsu() {
    apt-get -y install git && git clone https://github.com/sivel/speedtest-cli.git && cd ./speedtest-cli/ && ./speedtest.py && cd .. && rm -rf ./speedtest-cli
}
#5.安装宝塔面板
installbt() {
if [ -f /usr/bin/curl ];then curl -sSO https://download.bt.cn/install/install_panel.sh;else wget -O install_panel.sh https://download.bt.cn/install/install_panel.sh;fi;bash install_panel.sh ed8484bec
}
#6.安装BBR加速
installbbr() {
    cd /usr/src && wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
}
#7.XUI一键脚本安装
xuiinstall() {
    bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)
}
#8.更改root用户密码为www.yyzq.cf，开放ssh远程访问
#9.进入云大师
#10.安装青龙面板
#11.安装frp内网穿透
#12.安装哪吒面板
#13.检查/开启/关闭指定端口
#14.centos安装mysql
#15.centos一键安装umami网站统计工具
#16.服务器检测

#17.ping工具
#18.安装openvpn服务
#19.一键安装Acme 脚本
#20.一键安装aria2
#21.巡检服务器
xunjian() {
   rm -rf ./runxunjian.sh ; apt-get -y install wget ; wget https://raw.githubusercontent.com/nezha001/ywsjgongju/main/runxujian.sh ; chmod +x ./runxunjian.sh ; ./runxunjian.sh ; rm -rf ./runxunjian.sh
}




#安装docker与docker-compose
installdocker() {
        bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/DockerInstallation.sh)
}
#一键安装Acme 脚本
installacme() {
   sudo apt-get -y install openssl socat ; curl https://get.acme.sh | sh 
}



#一键安装aria2
installaria2(){
    sudo apt-get -y install wget curl ca-certificates && wget -N git.io/aria2.sh && chmod +x aria2.sh && ./aria2.sh
}



#一键安装nmap工具
installnmap() {
sudo apt-get update
sudo apt-get install nmap
nmap -V
     red "恭喜你nmap已经安装成功"    
     green "恭喜你nmap已经安装成功"
     yellow "恭喜你nmap已经安装成功"
}


#查看占用内存排名前10的应用
chakan_mem() {
        red "占用内存排名前10的应用是："
        red "++++++++++++++++++++++++++++++++++++++++++++"
ps aux --sort=-%mem | head -n 11
red "++++++++++++++++++++++++++++++++++++++++++++"
}

echo -e "
 =====================================================
 \033[33m欢迎使用《有云工具大师》
 欢迎$HOSTNAME的到来
 当前登录用户:$USER
 现在的时间是:$(date)
 当前所在位置是:$PWD
 当前系统是:$mylinux
 当前系统内核是:$kern
 当前内存使用率是:$my_mem
 当前/home磁盘使用率是:$my_home
 当前CPU平均使用率是:$my_cpu
 本脚本作者:有云转晴
 运维世界: https://www.ywsj.cf 
 有云转晴: https://www.yyzq.cf 
 有云导航: https://hao123.yyzq.cf 
 版本号:5.6.0
 编写日期:20230421\033[0m
 =====================================================" 
echo -e "\033[32m1.安装wget,git,bash-completion,net-tools,curl,make
2.查看本机ipv4公网IP
3.测网速
4.安装docker与docker-compose
5.安装宝塔面板
6.安装BBR加速
7.XUI一键脚本安装
8.更改root用户密码为www.yyzq.cf，开放ssh远程访问
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
0.退出脚本\033[0m
======================================================"
read -p  " 请输入以上数字查看系统相应信息: " num 
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
elif [  $num  == 0  ]; then
red " 我们下次再见，拜拜"
exit
else
red "兄弟：请输入以上数字[0-22]: " 
yellow "兄弟：请输入以上数字[0-22]: " 
green "兄弟：请输入以上数字[0-22]: " 
fi
 bash <(curl  https://raw.githubusercontent.com/nezha001/ywsjgongju/main/linux-ubuntu.sh)

