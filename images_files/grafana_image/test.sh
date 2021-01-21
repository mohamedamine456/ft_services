TESTGRAFANA=$(ps | grep -v grep | grep -c grafana)
TESTTELEGRAF=$(ps | grep -v grep | grep -c telegraf)

if [ $TESTGRAFANA -eq 1 ]
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
