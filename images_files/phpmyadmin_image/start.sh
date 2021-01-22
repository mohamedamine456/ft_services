php-fpm7 --pid /run/php-fpm.pid;
/usr/sbin/nginx -c /etc/nginx/nginx.conf;
telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid

TESTNGINX=$(ps | grep -v grep | grep -c nginx)
TESTPMA=$(ps | grep -v grep | grep -c php-fpm)
TESTTELEGRAF=$(ps | grep -v grep | grep -c telegraf)

if [ $TESTNGINX -eq 3 ]
then
	if [ $TESTPMA -eq 3 ]
	then
		if [ $TESTTELEGRAF -eq 1 ]
		then
			return 0
		else
			return 1
		fi
	else
		return 0
	fi
else
	return 1
fi
