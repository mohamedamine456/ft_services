PHPFILE=/run/php-fpm7/php-fpm.pid
NGINXFILE=/run/nginx.pid
TELEGRAFFILE=/run/telegraf.pid

if [ -f "$PHPFILE" -a -f "$NGINXFILE" -a -f "$TELEGRAFFILE" ]
then
	return 0
else
	return 1
fi
