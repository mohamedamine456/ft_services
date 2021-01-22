ps | grep -v grep | grep influx
TESTINFLUXDB=$?
ps | grep -v grep | grep telegraf
TESTTELEGRAF=$?

if [ $TESTINFLUXDB -eq 0 ]
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
