#!/bin/bash

apt update

apt install -y mysql-server unzip libapache2-mod-php7.2 php7.2-mbstring php7.2-cli php7.2-mysql php7.2-cgi php7.2-fpm php7.2-gd php7.2-imap php7.2-xml php7.2-intl php-dev libmcrypt-dev php-pear

service apache2 restart

mysql_secure_installation

mysql -u root -p

mysql service restart

cd /tmp/

wget https://github.com/osTicket/osTicket/releases/download/v1.12.2/osTicket-v1.12.2.zip

unzip osTicket-v1.12.2.zip

cp -r upload/* /var/www/html/
cp -r scripts/* /var/www/html/

rm -rf /var/www/html/index.html

cd /var/www/html/include/

cp ost-sampleconfig.php ost-config.php

cd

chown -R www-data:www-data /var/www/html/

chmod 755 -R /var/www/html

chmod 0666 /var/www/html/include/ost-config.php

echo "Now go to the server address, finish setup and come back here to perform
the finishing touches :) "

