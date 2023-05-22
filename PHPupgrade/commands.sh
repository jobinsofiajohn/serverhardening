wget  https://www.php.net/distributions/php-8.2.3.tar.gz
tar -xzvf  php-8.2.3.tar.gz
cd php-8.2.3

yum -y install gcc gcc-c++ sqlite-devel
yum -y install libxml2-devel openssl-devel curl-devel libjpeg-devel libpng-devel libicu-devel freetype-devel openldap-devel openldap openldap-devel
./configure --prefix=/usr/local/php --with-apxs2=/usr/bin/apxs
make && make install
cp php.ini-production /usr/local/php/lib/php.ini

vim /etc/httpd/conf/httpd.conf

add 
<FilesMatch "\.ph(p[2-6]?|tml)$">
    SetHandler application/x-httpd-php
</FilesMatch>

save and exit


    
