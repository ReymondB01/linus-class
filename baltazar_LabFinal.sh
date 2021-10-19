#!/bin/bash

echo "###############################"
echo "#                             #"
echo "#      Installing httpd       #"
echo "#                             #"
echo "###############################"
yum install wget rsync -y
yum install httpd -y

echo "###################################################"
echo "#                                                 #"
echo "#       Starting and Enabling Apache server       #"
echo "#                                                 #"
echo "###################################################"
systemctl start httpd
systemctl enable httpd

echo "###########################################################################"
echo "#                                                                         #"
echo "#        Adding the Firewall permissions for port 80 and port 443         #"
echo "#                                                                         #"
echo "###########################################################################"
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=443/tcp

echo "###################################################"
echo "#                                                 #"
echo "#        Starting to reload the firewall          #"
echo "#                                                 #"
echo "###################################################"
firewall-cmd --reload

echo "###################################################"
echo "#                                                 #"
echo "#         Installing php and php module           #"
echo "#                                                 #"
echo "###################################################"
yum install php php-mysql -y
yum install php-fpm -y
yum install php-gd -y

echo "###########################################################"
echo "#                                                         #"
echo "#       Restarting the Apache server in T -1 second       #"
echo "#                                                         #"
echo "###########################################################"
systemctl restart httpd

echo "###################################"
echo "#                                 #"
echo "#      The web Server is up!      #"
echo "#                                 #"
echo "###################################"

echo "<?php phpinfo(); ?>" > /var/www/html/index.php

echo "###################################################"
echo "#                                                 #"
echo "#      Installing mariadb-server and mariadb      #"
echo "#                                                 #"
echo "###################################################"
yum install mariadb-server mariadb -y
systemctl start mariadb
systemctl enable mariadb

echo "################################################"
echo "#                                              #"
echo "#       Secure Installation Proccessing...     #"
echo "#                                              #"
echo "################################################"

mysql_secure_installation <<HERE

y
Babymj3214
Babymj3214
y
y
y
y
HERE

echo "#######################################################"
echo "#                                                     #"
echo "#      The installation of a LAMP Stack is done!      #"
echo "#                                                     #"
echo "#######################################################"



echo "#######################################################"
echo "#                                                     #"
echo "#                Installing MySQL                     #"
echo "#                                                     #"
echo "#######################################################"

mysql -u root -pBabymj3214 << Mondsql
CREATE DATABASE wordpress;
CREATE USER wordpressuser@localhost IDENTIFIED BY 'Babymj3214';
GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost IDENTIFIED BY 'Babymj3214';
FLUSH PRIVILEGES;
Mondsql



wget -P /var http://wordpress.org/latest.tar.gz
tar xzvf /var/latest.tar.gz -C /var/
rsync -avP /var/wordpress/ /var/www/html/
mkdir /var/www/html/wp-content/uploads
chown -R apache:apache /var/www/html/*



cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i 's/database_name_here/wordpress/' /var/www/html/wp-config.php
sed -i 's/username_here/wordpressuser/' /var/www/html/wp-config.php
sed -i 's/password_here/Babymj3214/' /var/www/html/wp-config.php


echo "#######################################################"
echo "#                                                     #"
echo "#               Installing Wordpress                  #"
echo "#                                                     #"
echo "#######################################################"

yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
yum install yum-utils -y
yum-config-manager --enable remi-php56
yum install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo -y



systemctl restart httpd

echo "#######################################################"
echo "#                                                     #"
echo "#       The installation of Wordpress is done!        #"
echo "#                                                     #"
echo "#######################################################"

echo "#######################################################"
echo "#                                                     #"
echo "#            #######    #######    #####              #"
echo "#            #     #       #       #    #             #"
echo "#            #######       #       #####              #"
echo "#            # #           #       #    #             #"
echo "#            #   #         #       #    #             #"
echo "#            #     #       #       #####              #"
echo "#                                                     #"
echo "#######################################################"