#! /bin/bash

yum install httpd -y

my_pub_ip=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

echo "<h1> Congratulations for Provisioning the Infra through Terraform. And my IP is $my_pub_ip </h1>" > /var/www/html/index.html
chkconfig httpd on
service httpd start
