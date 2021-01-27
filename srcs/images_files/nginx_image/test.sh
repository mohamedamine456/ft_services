#! /bin/sh

ps | grep -v grep | grep nginx
TESTNGINX=$?
ps | grep -v grep | grep ssh
TESTSSH=$?
ps | grep -v grep | grep telegraf
TESTTELEGRAF=$?

if [ $TESTNGINX -eq 0 ]
then
	if [ $TESTSSH -eq 0 ]
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
