#!/usr/bin/env bash

apt-get update
apt-get install -y apache2

sudo cp -r /vagrant/static/ /var/www/
sudo cp -r /vagrant/dynamic/ /var/www/
sudo cp -r /vagrant/certificates /etc/apache2/certificates
sudo cp /vagrant/server.py /var/www/
sudo cp -fr /vagrant/configs/*.conf /etc/apache2/sites-available/

a2enmod ssl headers proxy proxy_http
a2ensite 000-default.conf default-ssl.conf
service apache2 reload

echo "127.0.0.1 static.devops" >> /etc/hosts
echo "127.0.0.1 dynamic.devops" >> /etc/hosts

apt-get install -y python3-pip
pip3 install -U pip aiohttp
nohup python3 /var/www/server.py