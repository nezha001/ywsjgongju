#!/bin/bash
echo -e "
 ====================================================
 \033[32m欢迎光临《云大师硬件检测》
 官方网站:https://www.yyzq.cf
 有云导航:https://hao123.yyzq.cf
 版本号:1.0.0
 编写日期:20220428\033[0m
 ====================================================="
echo -e "
\033[32m1.查看内核/操作系统/CPU信息
2.查看操作系统版本
3.查看CPU信息
4.查看计算机名
5.查看系统所有用户
6.列出加载的内核模块
7.查看环境变量 资源
8.查看内存使用量和交换区使用量
9.查看各分区使用情况
10.查看内存总量
11.查看系统运行时间、用户数、负载
12.查看系统负载 磁盘和分区
13.查看挂接的分区状态
14.查看所有分区
15.查看所有交换分区
16.查看所有网络接口的属性
17.查看防火墙设置
18.查看路由表
19.查看所有监听端口
20.查看网络统计信息 进程
21.查看活动用户
22.查看用户登录日志
23.查看本机公网ip
0.退出脚本\033[0m"
read -p "请输入以上数字[0-23]查看系统相应信息: " num 
if [  $num  == 1  ] ; then
uname -a
elif [  $num  == 2  ]; then
head -n 1 /etc/issue
elif [  $num  == 3  ]; then
cat /proc/cpuinfo
elif [  $num  == 4  ]; then
hostname
elif [  $num  == 5  ]; then
cut -d: -f1 /etc/passwd
elif [  $num  == 6  ]; then
lsmod
elif [  $num  == 7  ]; then
env
elif [  $num  == 8  ]; then
free -m
elif [  $num  == 9  ]; then
df -h
elif [  $num  == 10  ]; then
grep MemTotal /proc/meminfo
elif [  $num  == 11  ]; then
uptime
elif [  $num  == 12  ]; then
cat /proc/loadavg
elif [  $num  == 13  ]; then
mount | column -t
elif [  $num  == 14  ]; then
fdisk -l
elif [  $num  == 15  ]; then
swapon -s
elif [  $num  == 16  ]; then
ifconfig
elif [  $num  == 17  ]; then
iptables -L
elif [  $num  == 18  ]; then
route -n
elif [  $num  == 19  ]; then
netstat -lntp
elif [  $num  == 20  ]; then
netstat -s
elif [  $num  == 21  ]; then
w
elif [  $num  == 22  ]; then
last
elif [  $num  == 23  ]; then
curl ifconfig.me
elif [  $num  == 0  ]; then
exit
else
read -p "兄弟：请输入以上数字[0-23]: " num
fi
./yundashi.sh




