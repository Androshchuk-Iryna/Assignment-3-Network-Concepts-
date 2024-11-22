#!/bin/bash

sudo apt update
sudo apt install -y apache2 socat

sudo sed -i 's/Listen 80/Listen 10000/' /etc/apache2/ports.conf
sudo sed -i 's/:80/:10000/' /etc/apache2/sites-available/000-default.conf

# here i used AI 
sudo iptables -F
sudo iptables -A INPUT -i lo -p tcp --dport 10000 -j ACCEPT
sudo iptables -A INPUT ! -i lo -p tcp --dport 10000 -j DROP
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

sudo mkdir -p /etc/iptables
sudo iptables-save | sudo tee /etc/iptables/rules.v4

sudo cp proxyServer.sh /etc/
sudo chmod +x /etc/proxyServer.sh


sudo cp proxyServer.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start proxyServer
sudo systemctl restart apache2
