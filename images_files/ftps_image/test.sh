ps | grep -v grep | grep -c vsftpd
TESTFTPS=$?
ps | grep -v grep | grep -c telegraf
TESTTELEGRAF=$?

if [ $TESTFTPS -eq 0 ]
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
