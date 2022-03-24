#!/bin/bash

sudo yum install epel-release -y
echo "Inicio da Instalacao do Ansible"
sudo yum install ansible -y
sudo yum install vim -y

cat <<EOF >> /etc/hosts
192.168.1.2 control-node
192.168.1.3 app01
192.168.1.4 db01
EOF
cat <<EOF >> /etc/ansible/hosts
[app01]
192.168.1.3

[db01]
192.168.1.4
EOF