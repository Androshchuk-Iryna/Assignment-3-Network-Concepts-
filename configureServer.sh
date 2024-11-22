#!/bin/bash

sudo apt update
sudo apt install -y apache2 socat

sudo sed -i 's/Listen 80/Listen 10000/' /etc/apache2/ports.conf
sudo sed -i 's/:80/:10000/' /etc/apache2/sites-available/000-default.conf

# here i used AI 
sudo iptables -F
sudo iptables -A INPUT -p tcp --dport 10000 -s 127.0.0.1 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 10000 -j DROP

sudo mkdir -p /etc/iptables
sudo iptables-save | sudo tee /etc/iptables/rules.v4

sudo cp index.html /var/www/html/index.html
sudo cp error.html /var/www/html/error.html

sudo cp proxyServer.sh /etc/
sudo chmod +x /etc/proxyServer.sh


sudo cp proxyServer.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable proxyServer.service
sudo systemctl start proxyServer.service
