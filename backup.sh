#!/bin/bash
yum install tar -y
today=$(date +'%m%d%y')
mkdir /opt/backups

mysqldump -u root -pBabymj3214 wordpress > /opt/backups/wordpress_$today.sql

cd /opt/backups

tar -zcf wordpress_$today.tar.gz wordpress_$today.sql

echo "##############################"
echo "#                            #"
echo "#      Backup Complete!      #"
echo "#                            #"
echo "##############################"