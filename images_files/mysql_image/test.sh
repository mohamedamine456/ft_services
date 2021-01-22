ps | grep -v grep | grep mysql
TESTMYSQL=$?
ps | grep -v grep | grep telegraf
TESTTELEGRAF=$?
if [ $TESTMYSQL -eq 0 ]
then
	if [ $TESTTELEGRAF -eq 0 ]
	then
	else
		return 0
	fi
else
	return 1
fi
