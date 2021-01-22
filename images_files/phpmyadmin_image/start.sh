php-fpm7 --pid /run/php-fpm.pid;
/usr/sbin/nginx -c /etc/nginx/nginx.conf;
telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid

#sleep 5

#while true
#do
#	ps | grep -v grep | grep -c nginx
#	TESTNGINX=$?
#	ps | grep -v grep | grep -c php-fpm
#	TESTPMA=$?
#	ps | grep -v grep | grep -c telegraf
#	TESTTELEGRAF=$?

#	if [ $TESTNGINX -eq 0 ]
#	then
#		if [ $TESTPMA -eq 0 ]
#		then
#			if [ $TESTTELEGRAF -eq 0 ]
#			then
#				echo "NGINX PHP TELEGRAF DOING GOOD"
#				sleep 2
#			else
#				echo "TELEGRAF DOWN"
#				break
#			fi
#		else
#			echo "PHP DOWN"
#			break
#		fi
#	else
#		echo "NGINX DOWN"
#		break
#	fi
#done
