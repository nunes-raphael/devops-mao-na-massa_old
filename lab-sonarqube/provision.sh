#!/bin/bash

sudo useradd sonar
sudo yum update -y
sudo yum install wget java-11-openjdk-devel unzip -y
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.4.0.54424.zip
unzip sonarqube-9.4.0.54424.zip -d /opt
sudo mv /opt/sonarqube-9.4.0.54424 /opt/sonarqube
sudo chown -R sonar:sonar /opt/sonarqube
touch /etc/systemd/system/sonar.service
echo > /etc/systemd/system/sonar.service
cat <<EOF >> /etc/systemd/system/sonar.service
[Unit]
Description=Sonarqube service
After=syslog.target network.target

[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonar
Group=sonar
Restart=always

[Install]
WantedBy=multi-uset.target
EOF

sudo systemctl daemon-reload
sudo systemctl start sonar.service
sudo systemctl enable sonar.service

wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip
unzip sonar-scanner-cli-4.7.0.2747-linux.zip -d /opt/
sudo mv /opt/sonar-scanner-4.7.0.2747-linux /opt/sonar-scanner
sudo chown -R sonar:sonar /opt/sonar-scanner

echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile

curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum update -y
sudo yum install nodejs -y