apk update;

# DIRECTION

mkdir /www;

# NGINX

apk add --no-cache nginx;
apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/;

adduser -D -g 'www' www;

chown -R www:www /var/lib/nginx;
chown -R www:www /www;

mv /nginx.conf /etc/nginx/nginx.conf;

#PHP

apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo;
apk add php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd;
apk add php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-mbstring;
apk add php7-xmlrpc php7-bz2 php7-memcache php7-iconv php7-pdo_dblib php7-curl php7-ctype; 

mv /www.conf /etc/php7/php-fpm.d/www.conf;

# PHPMYADMIN

cd /www;

wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz;

tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz;

mv phpMyAdmin-4.9.0.1-all-languages phpmyadmin;

rm phpMyAdmin-4.9.0.1-all-languages.tar.gz;

mv /config.sample.inc.php /www/phpmyadmin/config.inc.php;

mkdir -m 777 /www/phpmyadmin/tmp;

cd /;

mv /telegraf.conf /etc/telegraf.conf;
