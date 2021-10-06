#!/bin/bash

echo ""
yum install httpd -y

echo ""
systemctl start httpd
systemctl enable httpd

echo ""
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=443/tcp

echo ""
firewall-cmd --reload

echo ""
yum install php php-mysql -y

echo ""
yum install php-fpm -y

echo ""
systemctl restart httpd

echo ""
echo "<?php phpinfo(); ?>" > /var/www/html/info.php