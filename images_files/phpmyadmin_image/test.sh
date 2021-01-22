#! /bin/sh

ps | grep -v grep | grep -c nginx
TESTNGINX=$?
ps | grep -v grep | grep -c php-fpm
TESTPMA=$?
ps | grep -v grep | grep -c telegraf
TESTTELEGRAF=$?

if [ $TESTNGINX -eq 0 ]
then
	if [ $TESTPMA -eq 0 ]
	then
		if [ $TESTTELEGRAF -eq 0 ]
		then
			return 0
		else
			return 1
		fi
	else
		return 1
	fi
else
	return 1
fi
