TESTNGINX=$(ps | grep -v grep | grep -c nginx)
TESTSSH=$(ps | grep -v grep | grep -c ssh)
TESTTELEGRAF=$(ps | grep -v grep | grep -c telegraf)

if [ $TESTNGINX -eq 3 ]
then
	if [ $TESTSSH -eq 1 ]
	then	
		if [ $TESTTELEGRAF -eq 1 ]
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
