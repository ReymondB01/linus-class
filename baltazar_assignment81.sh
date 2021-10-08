#!/bin/bash

echo "###############################"
echo "#                             #"
echo "#      Installing httpd       #"
echo "#                             #"
echo "###############################"
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
echo "#            #######    #######    #####              #"
echo "#            #     #       #       #    #             #"
echo "#            #######       #       #####              #"
echo "#            # #           #       #    #             #"
echo "#            #   #         #       #    #             #"
echo "#            #     #       #       #####              #"
echo "#                                                     #"
echo "#######################################################"