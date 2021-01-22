#/usr/sbin/nginx -c /etc/nginx/nginx.conf;
#/usr/sbin/sshd -D&
#telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid &> /dev/null;
#tail -f /var/log/nginx/access.log

#! /bin/sh

/usr/sbin/nginx -c /etc/nginx/nginx.conf
/usr/sbin/sshd -D&
telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid &> /dev/null &

sleep 5

while true
do
	TESTNGINX=$(ps | grep -v grep | grep -c nginx)
	TESTSSH=$(ps | grep -v grep | grep -c ssh)
	TESTTELEGRAF=$(ps | grep -v grep | grep -c telegraf)

	if [ $TESTNGINX -eq 3 ]
	then
		if [ $TESTSSH -eq 1 ]
		then
			if [ $TESTTELEGRAF -eq 1 ]
			then
				echo "NGINX SSH TELEGRAF DOIND GOOD"
				sleep 2
			else
				echo "TELEGRAF DOWN"
				break
			fi
		else
			echo "SSHD WOEN"
			break
		fi
	else
		echo "NGINX DOWN"
		break
	fi
done
