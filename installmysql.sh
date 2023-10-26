#!bin/bash
rpm  -q  mariadb-server  mariadb
systemctl  stop  mariadb 
rpm  -e  --nodeps  mariadb  mariadb-server 
rm  -rf  /etc/my.cnf  
rm  -rf  /var/lib/mysql/*
yum -y install wget && wget  http://152.67.98.47:8889/down/NFGtj3Ix1wKk -O mysql-5.7.17.tar
tar  -xf mysql-5.7.17.tar
yum -y install mysql-community-*.rpm
systemctl  start mysqld
systemctl  enable mysqld
netstat  -utnlp  | grep  3306
ps -C mysqld
grep password  /var/log/mysqld.log | tail -1
rm -rf mysql-5.7.17.tar

