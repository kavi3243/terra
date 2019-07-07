#! /bin/bash

yum install httpd -y
echo "<h1> Provisioning through Terraform is Successful</h1>" > /var/www/html/index.html
chkconfig httpd on
service httpd start
