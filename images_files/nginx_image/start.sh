#! /bin/sh

/usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;" &> /dev/null &
/usr/sbin/sshd -D&
telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid

#sleep 5

#while true
#do
#	NOW=`date +"%D %T"`
#	ps | grep -v grep | grep nginx
#	TESTNGINX=$?
#	ps | grep -v grep | grep ssh
#	TESTSSH=$?
#	ps | grep -v grep | grep telegraf
#	TESTTELEGRAF=$?

#	if [ $TESTNGINX -eq 0 ]
#	then
#		if [ $TESTSSH -eq 0 ]
#		then
#			if [ $TESTTELEGRAF -eq 0 ]
#			then
#				echo "$NOW: NGINX WORKING!"
#				echo "$NOW: SSH WORKING!"
#				echo "$NOW: TELEGRAF WORKING!\n"
#				sleep 5
#			else
#				echo "$NOW: TELEGRAF DOWN!"
#				break
#			fi
#		else
#			echo "$NOW: SSH DOWN"
#			break
#		fi
#	else
#		echo "$NOW: NGINX DOWN"
#		break
#	fi
#done
