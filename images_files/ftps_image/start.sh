/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf &> /dev/null &

telegraf -config /etc/telegraf.conf -pidfile /run/telegraf.pid &> /dev/null &

sleep 5

while true
do
	TESTFTPS=$(ps | grep -v grep | grep -c vsftpd)
	TESTTELEGRAF=$(ps | grep -v grep | grep -c telegraf)

	if [ $TESTFTPS -eq 1 ]
	then
		if [ $TESTTELEGRAF -eq 1 ]
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
