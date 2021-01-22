php-fpm7 --pid /run/php-fpm.pid;
/usr/sbin/nginx -c /etc/nginx/nginx.conf;
telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid &> /dev/null &

while true
do
	TESTNGINX=$(ps | grep -v grep | grep -c nginx)
	TESTPMA=$(ps | grep -v grep | grep -c php-fpm)
	TESTTELEGRAF=$(ps | grep -v grep | grep -c telegraf)

	if [ $TESTNGINX -eq 3 ]
	then
		if [ $TESTPMA -eq 3 ]
		then
			if [ $TESTTELEGRAF -eq 1 ]
			then
				echo "NGINX PHP TELEGRAF DOING GOOD"
				sleep 2
			else
				echo "TELEGRAF DOWN"
				break
			fi
		else
			echo "PHP DOWN"
			break
		fi
	else
		echo "NGINX DOWN"
		break
	fi
done
