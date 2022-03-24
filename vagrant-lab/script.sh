#!/usr/bin/env bash

echo "Atualizando o Sistema Operacional"
yum update -y

echo "Instalando e configurando o Apache"
yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
cp -r /vagrant/html /var/www/
sudo systemctl restart httpd
