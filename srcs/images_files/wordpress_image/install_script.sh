apk update;

# DIRECTION

mkdir /www;

# NGINX

apk add --no-cache nginx;
apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/;

adduser -D -g 'www' www;

chown -R www:www /var/lib/nginx;

mv /nginx.conf /etc/nginx/nginx.conf;

# PHP

apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo;
apk add php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd;
apk add php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-mbstring;
apk add php7-xmlrpc php7-bz2 php7-memcache php7-iconv php7-pdo_dblib php7-curl php7-ctype;

mv /www.conf /etc/php7/php-fpm.d/www.conf;

# WORDPRESS

cd /usr/share/ && mkdir webapps && cd webapps;
wget http://wordpress.org/latest.tar.gz;
tar -zxvf latest.tar.gz;
rm latest.tar.gz;
mv /wp-config.php /usr/share/webapps/wordpress/wp-config.php;

chown -R www:www /usr/share/webapps/;
ln -s /usr/share/webapps/wordpress /www/wordpress;

mv /telegraf.conf /etc/telegraf.conf;
