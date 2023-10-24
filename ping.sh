#! /bin/bash
read -p "请输入IP：" ip 
ping -c 1 $ip
if [ $? -eq 0 ]; then
	echo "ping $ip  成功!"
else
	echo "ping  $ip 失败!"
fi
