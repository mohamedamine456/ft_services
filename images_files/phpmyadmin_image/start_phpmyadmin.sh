/etc/init.d/php-fpm7 start;
/etc/init.d/nginx start;
telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid

#tail -f /var/log/php7/error.log
