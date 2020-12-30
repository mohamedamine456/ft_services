/etc/init.d/php-fpm7 start;
/etc/init.d/nginx start;
tail -f /var/log/php7/error.log
