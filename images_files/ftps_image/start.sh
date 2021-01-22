/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf &> /dev/null &

telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid &> /dev/null &

sleep 5

while true
do
	ps | grep -v grep | grep -c vsftpd
	TESTFTPS=$?
	ps | grep -v grep | grep -c telegraf
	TESTTELEGRAF=$?

	if [ $TESTFTPS -eq 0 ]
	then
		if [ $TESTTELEGRAF -eq 0 ]
		then
			echo "FTPS TELEGRAF DOIND GOOD"
			sleep 2
		else
			echo "TELEGRAF DOWN"
			break
		fi
	else
		echo "FTPS DOWN"
		break
	fi
done
