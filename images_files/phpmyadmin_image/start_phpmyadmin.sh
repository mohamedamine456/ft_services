php-fpm7 --pid /run/php-fpm.pid;
/usr/sbin/nginx -c /etc/nginx/nginx.conf;
telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid
