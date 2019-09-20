#!/bin/bash

apt update

apt install openssh-server -y

ufw enable

ufw allow 'Apache Full'

ufw status

ufw allow 'OpenSSH'

cp default-ssl.conf /etc/sites-available/default-ssl.conf

a2enmod ssl

a2ensite default-ssl.conf

service apache2 restart

ufw status
