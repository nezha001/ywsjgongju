#/bin/bash
sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
#echo 123456|passwd --stdin root
echo "root:123456"|chpasswd
systemctl restart sshd
curl ifconfig.me