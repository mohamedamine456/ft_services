TESTINFLUXDB=$(ps | grep -v grep | grep -c influx)
TESTTELEGRAF=$(ps | grep -v grep | grep -c telegraf)

if [ $TESTINFLUXDB -eq 1 ]
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
